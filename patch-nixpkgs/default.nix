# All standard nixpkg with patch for BBP usage
{
 std-pkgs
}:


let
    MergePkgs = with MergePkgs;  std-pkgs // patches;
    patches = with patches; with MergePkgs; { 
        
		  hdf5-cpp = callPackage ./hdf5 {
			szip = null;
			mpi = null;
			enableCpp = true;
		  };         


		  mvapich2 = callPackage ./mvapich2 {
			slurm = slurm-llnl;	
		  };

		  libnss-native-plugins = callPackage ./nss-plugin {


		  };

		 environment-modules =  callPackage ./env-modules { 
			tcl = tcl-8_5;
		 };
		 
		 envModuleGen = callPackage ./env-modules/generator.nix;

    };
       
in
  MergePkgs




