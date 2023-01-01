function Object_Found = ObjectFoundMatrix(v,IndexX_1,IndexX_2,IndexY_1,IndexY_2,FrameNum,StartX,StartY,StartZ,speedX,f_Camera,n_LaserPlane,l_SinglePixelSize)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ObjectFoundMatrix is designed to calculate the coordinates of the target using laser triangulation                            %
% v -- video file, v = VideoReader("your video")                                                                                %
% IndexX_1, IndexX_2, IndexY_1, IndexY_2 -- ROI of your target, will ignore all the information out of the interested range     %
% FrameNum -- frame number of the "actual" peak calculated by the average of four intersections                                 %
% StartX, StartY, StartZ -- initial position of the laser liner                                                                 %
% speedX -- speed of the laser liner. In this project, we only have speed at the x-axis                                         %
% f_Camera -- focal length of the camera, measured in mm                                                                        %
% n_LaserPlane -- incidence angle of laser liner                                                                                %
% l_SinglePixelSize -- physical size of one pixel, read from camera calibration                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FrameRate = v.FrameRate;                            % prepare to calculate the position of laser liner

p_xindex = 1:v.Width;
p_yindex = 1:v.Height;
p_yindex = p_yindex';
p_imagesensor(:,:,1) = repmat(p_xindex,v.Height,1); % image coordinate to world coordinate
p_imagesensor(:,:,2) = repmat(p_yindex,1,v.Width);

ObjectInfo(:,:,1) = FrameNum(IndexY_1:IndexY_2,IndexX_1:IndexX_2);              % read the frame number of the actual peak --> provide a time to calculate the position of laser liner
ObjectInfo(:,:,2) = StartX * ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);     % position of laser liner
ObjectInfo(:,:,3) = StartY * ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);
ObjectInfo(:,:,4) = StartZ * ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);
% update the position of laser liner
ObjectInfo(:,:,2) = ObjectInfo(:,:,2) + speedX*ObjectInfo(:,:,1)/FrameRate;     % only x changes

p_RealWorld(:,:,1) =  l_SinglePixelSize*((-v.Width/2) + p_imagesensor(:,:,1));  % world coordinates of the pixel
p_RealWorld(:,:,2) = f_Camera * ones(v.Height,v.Width);
p_RealWorld(:,:,3) = l_SinglePixelSize*((v.Height/2)-p_imagesensor(:,:,2));

p_RealWorldROI = p_RealWorld(IndexY_1:IndexY_2,IndexX_1:IndexX_2,:);

c_CameraMatrix = zeros(v.Height,v.Width,3);
c_CameraMatrixROI = c_CameraMatrix(IndexY_1:IndexY_2,IndexX_1:IndexX_2,:);

line_Pixel2CameraMatrix = p_RealWorldROI - c_CameraMatrixROI;
line_Laser2CameraMatrix = ObjectInfo(:,:,2:4) - c_CameraMatrixROI;

n_LaserPlaneMatrix(:,:,1) = n_LaserPlane(1)*ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);
n_LaserPlaneMatrix(:,:,2) = n_LaserPlane(2)*ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);
n_LaserPlaneMatrix(:,:,3) = n_LaserPlane(3)*ones(IndexY_2-IndexY_1+1,IndexX_2-IndexX_1+1);

gamma_1 = dot(n_LaserPlaneMatrix,line_Laser2CameraMatrix,3);
gamma_2 = dot(n_LaserPlaneMatrix,line_Pixel2CameraMatrix,3);
gamma_Camera2ObjectMatrix = gamma_1./gamma_2;

gamma_Camera2ObjectMatrix = repmat(gamma_Camera2ObjectMatrix,[1,1,3]);

% find the target
Object_Found = c_CameraMatrixROI + gamma_Camera2ObjectMatrix.*line_Pixel2CameraMatrix;
ObjectInfoNZero = repmat(ObjectInfo(:,:,1),[1 1 3]);
Object_Found = Object_Found.*(ObjectInfoNZero>=1);  % all所有在读取max数值的过程中产生0值的位置，返回为点（0，0，0）


end