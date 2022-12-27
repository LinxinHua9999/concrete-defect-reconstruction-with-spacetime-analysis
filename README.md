# 3D reconstruction of concrete defects using optical laser triangulation and modified spacetime analysis
This is an introduction for “3D reconstruction of concrete defects using optical laser triangulation and modified spacetime analysis” (https://www.sciencedirect.com/science/article/pii/S0926580522003429). It aims to extract 3D information of concrete defects from small-to-medium-scale specimens using ***optical approaches (optical laser triangulation)***. The described method in this paper helps eliminating the reconstruction error due to reflectivity (aggregates) and occlusion (edges).

I will briefly introduce what you can achieve and what you need in this README file. You can check the list at the end and find more detailed explanation.

Hope it helps anyone who is interested in this or other related topics.
## What you can get
Here are some images of the specimens and reconstruction results (the scanned surface and its zoom-in view). We compared the described method with thinning method and the Steger method (two typical centre extraction algorithms for laser stripes in optical laser triangulation). The described method provides more information within aggregate and edge sections.

![](README_material_in_doc/README_images/1.jpg)
![](README_material_in_doc/README_images/2.jpg)

## What you need
In a typical optical laser triangulation system, there are two items you must have: a **laser liner** and a **camera**. We used a general laser liner and a GoPro in this work. The camera was fixed on a tripod, facing the target. The laser liner was mounted on a **small gantry robot** which enables precise control of the movement. During the scanning, the laser liner can be carried by the gantry robot and move with a constant speed, scanning across the target. Except the captured images or videos, you need the following data to do reconstruction:

1.	Coordinates of camera
2.	Coordinates of laser liner (by tracking its movement) and its angle of inclination

![](README_material_in_doc/README_images/3.jpg)

## Workflow
List the steps…
