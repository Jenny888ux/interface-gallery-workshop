// array deklarieren und initialisieren
int[] nums = new int[20];

// array kreieren
for (int i = 0; i < nums.length; i++) {
  nums[i] = (int)random(100);
}

//Hilfsvariablen
int biggest = 0;
int smallest = 100;

// hier suche den kleinsten Wert und den größten Wert
for (int i = 0; i < nums.length; i++) {
  if (nums[i]> biggest) {
    biggest = nums[i];
  }
  if (nums[i]< smallest) {
    smallest = nums[i];
  }
}

println(nums);
println("biggest = "+ biggest + " , smallest = " + smallest);
