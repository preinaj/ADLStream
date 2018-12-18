#!/bin/bash

output_dir_path=/home/pedrolarben/datastream/dcos/volume0/aarcos/DSClassificationResults
classifiers=(ActiveClassifier NaiveBayes SingleClassifierDrift MajorityClass Perceptron SGD SPegasos LeveragingBag OCBoost OzaBag OzaBagASHT OzaBagAdwin OzaBoost OzaBoostAdwin WeightedMajorityAlgorithm DecisionStump HoeffdingOptionTree AdaHoeffdingOptionTree HoeffdingTree ASHoeffdingTree HoeffdingAdaptiveTree RandomHoeffdingTree)
topics=(streams_airlinesnorm streams_bankmarketingnorm streams_breast streams_carnorm streams_convtype streams_electricity streams_higgs200k streams_kddcup99norm streams_ozone streams_pendigits streams_pokerhand streams_spambase streams_susy100k streams_Adiac streams_ArrowHead streams_Beef streams_BeetleFly streams_BirdChicken streams_Car streams_CBF streams_ChlorineConcentration streams_CinCECGtorso streams_Coffee streams_Computers streams_DiatomSizeReduction streams_DistalPhalanxOutlineAgeGroup streams_DistalPhalanxOutlineCorrect streams_DistalPhalanxTW streams_Earthquakes streams_ECG200 streams_ECG5000 streams_ECGFiveDays streams_ECGMeditation streams_ElectricDevices streams_FaceAll streams_FaceFour streams_FacesUCR streams_FiftyWords streams_Fish streams_FordA streams_FordB streams_GunPoint streams_Ham streams_HandOutlines streams_Haptics streams_Herring streams_InlineSkate streams_InsectWingbeatSound streams_ItalyPowerDemand streams_LargeKitchenAppliances streams_Lightning2 streams_Lightning7 streams_Mallat streams_Meat streams_MedicalImages streams_MiddlePhalanxOutlineAgeGroup streams_MiddlePhalanxOutlineCorrect streams_MiddlePhalanxTW streams_MoteStrain streams_NonInvasiveFetalECGThorax1 streams_NonInvasiveFetalECGThorax2 streams_OliveOil streams_OSULeaf streams_PhalangesOutlinesCorrect streams_Phoneme streams_Plane streams_ProximalPhalanxOutlineAgeGroup streams_ProximalPhalanxOutlineCorrect streams_ProximalPhalanxTW streams_RefrigerationDevices streams_ScreenType streams_ShapeletSim streams_ShapesAll streams_SmallKitchenAppliances streams_SonyAIBORobotSurface1 streams_SonyAIBORobotSurface2 streams_StarlightCurves streams_Strawberry streams_SwedishLeaf streams_Symbols streams_SyntheticControl streams_ToeSegmentation1 streams_ToeSegmentation2 streams_Trace streams_TwoLeadECG streams_TwoPatterns streams_UWaveGestureLibraryAll streams_UWaveGestureLibraryX streams_UWaveGestureLibraryY streams_UWaveGestureLibraryZ streams_Wafer streams_Wine streams_WordSynonyms streams_Worms streams_Yoga)
for topic in ${topics[@]}; do
	for clf in ${classifiers[@]}; do
		echo "Consuming $topic with classifier $clf"
		nohup mesos-execute --master=10.141.0.224:5050 --name="$topic moa $clf consumer" --command="java -jar ../projects/MOAKafka.jar $topic true $clf $output_dir_path" &	
	done
done 