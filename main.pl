#!/usr/bin/perl

if($#ARGV == -1){
  $dir = "./";
} else {
  $dir = @ARGV[0];
  $char = substr($dir, scalar($dir) - 1, 1);

  if($char ne "/"){
    $dir = "$dir/";
  }
}

$files_c = "find $dir -maxdepth 1 -type f";
$files = `$files_c`;
@files = split('\n', $files);
$size = scalar(@files);
$file_list = join(" ", @files);

if($size == 0){
  exit 0;
}

$md5sums_c = "md5sum $file_list";

$md5sums_raw = `$md5sums_c`;
@md5sums = split('\n', $md5sums_raw);
$md5sums_length = scalar(@md5sums);

for($i = 0; $i < $md5sums_length; $i++){
  $mf_raw = @md5sums[$i];
  @mf = split(' ', $mf_raw);
  $mf_length = length(@mf[0]);
  $mf_printed = 0;

  if($mf_length == 32){

    for($j = $i + 1; $j < $md5sums_length; $j++){
      $mf_raw_sec = @md5sums[$j];
      @mf_sec = split(' ', $mf_raw_sec);
      $mf_length_sec = length(@mf_sec[0]);

      if($mf_length_sec == 32){

        if(@mf[0] eq @mf_sec[0]){
          if(!$mf_printed){
            print "@mf[0] - @mf[1]\n";
            $mf_printed = 1;
          }

          print "@mf_sec[0] - @mf_sec[1]\n";
          $md5sums[$j] = "1$md5sums[$j]";
        }
      }
    }

    if($mf_printed){
      print "\n";
    }
  }
}
