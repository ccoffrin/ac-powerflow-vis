Visualizations of AC Power Flow over a Line
=====

### What is this?
These R scripts produce figures and animations of AC Power Flow over a line, which help build an intuition for the AC Power Flow equations' behavior based on different line parameters (e.g. admittance).  These scripts assume a simple restive line model and also include parameters for an ideal transformer.  The default parameters are set to [typical values](https://books.google.com/books/about/Power_System_Stability_and_Control.html?id=2cbvyf8Ly4AC) for high-voltage power transmission lines.

This repository contains the source files required for generating the visualizations.  The `make.it` script builds all of the figures and animations.  An example of the output of the script can be viewed [here](tbd).  The `ac_power_examples.r` illustrates how to change the line parameters to and generate new figures.

### Requirements
This script requires R for building the PDFs and imagemagick's convert for combining them into a gif.  The bash terminal is required for `make.it`.  A typical compilation of `make.it` is around 10 minutes.
