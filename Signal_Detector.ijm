setBatchMode(true);

path = getDirectory("Choose a directory")
filelist = getFileList(path);
for (i=0; i < filelist.length; i++) {
	if(endsWith(filelist[i], "zvi")) {
		run("Bio-Formats Importer", "open=[" + path + filelist[i] + "] autoscale color_mode=Default split_channels view=Hyperstack stack_order=XYCZT");
		close();
		close();
		run("Auto Threshold", "method=Triangle white");
		run("Analyze Particles...", "size=10-Infinity pixel show=Outlines display summarize in_situ");
	}
}
selectWindow("Summary");
saveAs("results", path + "/Results_Fluorescence_Signal.csv");

setBatchMode(false);
