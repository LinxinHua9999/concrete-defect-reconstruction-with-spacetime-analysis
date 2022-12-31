# RawData #

Here we have 6 videos for anyone who is interested to try. Those videos were taken as described below. 

I put them in a Google Drive folder and anyone with this [link](https://drive.google.com/drive/folders/1UA8Ou1_pZLtrN8g0FZ9s6NKGzCt6YxnV?usp=share_link) can easily download them. If you want to go through the example code, you need to download 1-2.MP4.

---

The following content describes the details of data collection, which comes from the section 3, Reconstruction of defects, of “[3D reconstruction of concrete defects using optical laser triangulation and modified spacetime analysis](https://www.sciencedirect.com/science/article/abs/pii/S0926580522003429)” (figure titles are missing). It includes:

* what the hardware looks like
* what the videos look like (basic parameters of the video)
* what the specimens look like  

---

### 3.1 Hardware system

A simple optical laser triangulation system has been built with a laser ray generator and a camera presented in Figure 13. A linear laser ray generator (MTO-laser MB-12A650-5-L) was mounted on a gantry robot (500 mm×1000 mm Newmark CS Series Belt Drive Linear Stage with a resolution of 3.6 μm). It can cast linear laser stripes onto the specimens and highlight the geometric transition on the scanned surfaces. The average width of the projected laser stripes onto the specimens was around 1.3 mm under the system settings in this work. A GoPro HERO10 camera was used to record the information of the reflected light, and it was fixed at a pre-defined position on a tripod. A lift table was used to enable easy adjustment for the object height. In this case, the object position can be quickly modified to guarantee that the object can be located at the centre of the images.

![](https://github.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/blob/main/README_material_in_doc/README_images/3_hardware.jpg?raw=true)

A Cartesian coordinate system (unit: mm) is developed, as shown in Figure 13, where all three axes pass the camera centre. The x-axis and y-axis are parallel to the table, while the z-axis is perpendicular to it. The x-axis is parallel to the movement direction of the gantry robot, and the y axis is perpendicular to it. The camera centre (centre of the camera lens) and the start point of the laser centre (centre of laser lens) are at two pre-defined positions. The laser ray generator moves with a constant speed which was set as 5 mm/sec in this study to the negative direction of the x-axis. 

The recording of the camera and the movement of the laser ray generator start simultaneously. In this system, the camera centre and the image sensor are at a fixed position. The laser ray generator moves during recording, and the generated laser plane is perpendicular to the table.

### 3.2 Video capture

The camera parameters were set to a pre-defined recording mode, “5.3 k, 60 Hz, narrow”, and this setting can generate videos with the highest imaging resolution. The lens distortion is corrected with the built-in algorithm of the camera. A recording generally lasts for around 20 seconds with a frame rate of 59.9402 frame/sec. Each frame has 5312×2988=15,872,256 pixels. 

Figure 14 shows one typical frame extracted from a trial capture. The laser stripe can be viewed, and its shape changes where the geometric feature of the object changes. The object is generally located at the centre of the images, and the object region has around 1600×1600≈2,560,000 valid pixels for reconstruction, as illustrated with a white dotted line box in Figure 14. The number of valid pixels depends on the actual dimensions of the object and the distance between the object and the camera.

<img src="https://raw.githubusercontent.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/cc6869633e7e94159aa4f6f1d9cace1df20a9ba7/README_material_in_doc/README_images/6_TypicalFrames.svg" alt="drawing" width="400"/>

An add-on interference-coating-based narrow bandpass optical filter was applied to the camera. It passes more than 95% of light with a wavelength around 630 nm and less than 5% of others. As the laser ray source generates 650 nm laser beams, the laser stripes can be much brighter than other parts in the video. With this optical filter, only red channel values are significant and most of the noise is filtered.

The resolution of the proposed system is determined by the number of pixels within the range of interest. With the system settings in this work, a single point from the point cloud represents the information of a small portion of the specimen (target portion). Within the Cartesian coordinate system applied in this study, this small portion in the trial capture is a 0.047 mm×0.047 mm square if being projected to the XZ plane. The dimensions of the projected square are consistent during a single scanning and changes in every capture. And, the depth resolution of the point cloud decreases if the included angle between the small portion and the XZ plane increases.

### 3.3 Specimen and loading test

Nine concrete cubes (75 mm×75 mm×75 mm, scanned region: 75 mm×7 5mm) and one under-reinforced concrete beam (100 mm×200 mm×1500 mm, scanned region: 150 mm×150 mm) were fabricated and loaded to failure after curing for 28 days. 

For the concrete cubes, the compressive loading process was manually controlled based on the continuous observation of the specimen damage. The load was applied and slowly increased until the expected damage feature occurred. The nine specimens were divided into three groups, and specimens in each group had similar defect features. Figure 15 presents the surfaces of typical specimens from three groups with different defect features. The selection of defect features was determined to qualitatively assess the capability of the proposed approach in correcting the two imaging errors of the typical methods. In Group 1, crack is the dominant defect feature, and spalling occurs, generating the sudden geometric transition with varied depth differences. Massive, exposed aggregate dominates Group 3, enabling practical evaluation for reconstructing aggregate regions. Group 2 is designed with both defect features from Groups 1 and 3. Furthermore, it is designed to enhance the variety of samples under complex scenarios.

<img src="https://raw.githubusercontent.com/LinxinHua9999/concrete-defect-reconstruction-with-spacetime-analysis/c8bd6e6782b6be50feb46478d6bc10e8bde6a72c/README_material_in_doc/README_images/7_TypicalSpecimens.svg" alt="drawing" width="600"/>

...