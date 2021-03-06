# Tests of densityPlot function

library(ftmsRanalysis)

data("examplePeakData")
data("exampleProcessedPeakData")
peakObj <- subset(exampleProcessedPeakData, groups="M_S")
samples <- as.character(dplyr::filter(getGroupDF(peakObj), Group=="M_S")$SampleID)

# should plot all sample curves, no histograms, no groups
densityPlot(peakObj, "NOSC", samples=NA, groups = FALSE)

# should plot one group and several samples, no hist, no warning
densityPlot(peakObj, variable="kmass", groups="M_S", samples=samples, plot_curve = TRUE, plot_hist = FALSE)

# should plot one sample, curve and hist
densityPlot(peakObj, variable="NOSC", samples="EM0011_sample", groups=FALSE, plot_curve=TRUE, plot_hist=TRUE)

# one sample, hist only, density y axis
densityPlot(peakObj, variable="NOSC", samples="EM0011_sample", groups=FALSE, plot_curve=FALSE, plot_hist=TRUE)

# one sample, hist only, count y axis
densityPlot(peakObj, variable="NOSC", samples="EM0011_sample", groups=FALSE, plot_curve=FALSE, 
                plot_hist=TRUE, yaxis="count")

# one sample, curve only
densityPlot(peakObj, variable="NOSC", samples="EM0011_sample", groups=FALSE, plot_curve=TRUE, plot_hist=FALSE)

# two groups, curves only
densityPlot(exampleProcessedPeakData, variable="NOSC", samples=FALSE, groups=c("M_S", "M_C"), plot_curve=TRUE, plot_hist=FALSE)

# one group, hist and curve
densityPlot(exampleProcessedPeakData, variable="NOSC", samples=FALSE, groups=c("M_S"), plot_curve=TRUE, plot_hist=TRUE)

# two groups, custom colors
densityPlot(exampleProcessedPeakData, variable="NOSC", samples=FALSE, groups=c("M_S", "M_C"), plot_curve=TRUE, 
                plot_hist=FALSE, curve_colors=c(M_S="green", M_C="red"))

# one group, curve and hist, custom colors
densityPlot(exampleProcessedPeakData, variable="NOSC", samples=FALSE, groups="M_C", plot_curve=TRUE, 
                plot_hist=TRUE, curve_colors=c(M_C="green"), hist_color="#0000FF66")


# custom labels
densityPlot(exampleProcessedPeakData, variable="NOSC", samples=FALSE, groups="M_C", plot_curve=TRUE, 
                plot_hist=TRUE, curve_colors=c(M_C="green"), hist_color="#0000FF66",
                xlabel="My X Label", ylabel="My Y Label", title="Some Title")


# make sure it doesn't fail if there is no groupDF
densityPlot(examplePeakData, variable="NeutralMass", samples="EM0011_sample", groups=NA, plot_curve=TRUE, 
                plot_hist=TRUE)

