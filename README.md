# 3D reconstruction of concrete defects using optical laser triangulation and modified spacetime analysis
This is an introduction for “3D reconstruction of concrete defects using optical laser triangulation and modified spacetime analysis” (https://www.sciencedirect.com/science/article/pii/S0926580522003429). It aims to extract 3D information of concrete defects from small-to-medium-scale specimens using ***optical approaches (optical laser triangulation)***. The described method in this paper helps eliminating the reconstruction error due to reflectivity (aggregates) and occlusion (edges).

I will briefly introduce what you can achieve, what you need, and spacetime analysis in this README file. At the end of this introduction, you will find all the steps to walk through an example project. The provided code were written in MATLAB. You can find the detailed explanation in the corresponding folders.



---
## What you can get
Here are some images of the specimens and reconstruction results (the scanned surface and its zoom-in view). We compared the described method with thinning method and the Steger method (two typical centre extraction algorithms for laser stripes in optical laser triangulation). The described method provides more information within the aggregate and edge sections.

> <img src="https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/1.jpg?raw=true" alt="drawing" width="700"/>
> <img src="https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/2.jpg?raw=true" alt="drawing" width="700"/>

---
## What you need
In a typical optical laser triangulation system, there are two items you must have: a **laser liner** and a **camera**. We used a general laser liner and a GoPro (HERO10) in this work. The camera was fixed on a tripod, facing the target. The laser liner was mounted on a **small gantry robot** which enables precise control of the movement. During the scanning, the laser liner can be carried by the gantry robot and move with a constant speed, scanning across the target. Except the captured images or videos, you need the following data to do reconstruction:

1.	Coordinates of camera
2.	Coordinates of laser liner (by tracking its movement) and its angle of inclination

> <img src="https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/3.jpg?raw=true" alt="drawing" width="400"/>

The described system is the same as a typical optical laser triangulation system. The difference is how we identify the central lines of the laser stripes.

---
## Spacetime analysis
The following image presents a typical process of a general optical laser triangulation application. The described method changed the steps 3 & 4 to a modified spacetime analysis.

> <img src="https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/4_StepsInLaserTri.jpg?raw=true" alt="drawing" width="500"/>


Spacetime analysis was first proposed by Brain Curless and Marc Levoy in 1995 (https://graphics.stanford.edu/papers/spacetime/spacetime_full.pdf), which is basically analysing the frames from the perspective of pixels (it's my personal understanding). With the normal laser triangulation algorithms, we need to identify the range of laser stripes and then find the central lines. It is critical to have the boundaries precisely identified. The spacetime analysis doesn't really care about the the shape of laser stripes, it cares more about the temporal distribution of the intensity based on the following assumption: 
> The illuminant we consider is a laser with a unidirectional Gaussian radiance profile.

As presented in the following image, the illuminant has a Gaussian profile. During scanning, it (illuminant/laser) moves with a constant speed. If we observe a specific sensor/pixel, its reading/intensity should follow the Gaussian distribution. Then the task can be switched to finding the central lines of the Gaussian profiles. Once the central line of the Gaussian profile was found, we can solve for the coordinates of the illuminant (by tracking its movement with speed and time) to form a triangle (illuminant, camera/sensor, a point on the target).


> <img src="https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/5_spacetimeprinciple.jpg?raw=true" alt="drawing" width="500"/>


From my point of view, the spacetime analysis changes the objects to be processed from the laser stripes to pixels. And, in practice, the laser stripe will always have a width, no matter it is 1 mm or 2 mm, which is generally wider than one or two pixels. In that way, the accuracy increases.

If your target object has smooth surface, the spacetime analysis probably won't give you a better result as it is easy to have accurate boundary. Otherwise, it will definitely be a potential solution for you. 

However, if you try to search spacetime analysis, probably you won't get what you want. It was rarely applied in computer vision, if you ask me, probably because of the low scanning speed. From my experience, the scanning speed was limited to tens of millimetres per second (frame rate is 120 Hz) to collect sufficient readings for one pixel. I applied 5 mm/s to achieve around 40-50 (based on my memory) valid data points for one pixel to generate the point clouds in the first two images.

---
## What you can find here
walk through of an example project

operation to collect data, what your data looks like

steps to process a data

...