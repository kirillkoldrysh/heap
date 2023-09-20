<?php

$sequence = [1, -2, 4, 5, -1, -5, 2, 7];
echo getMaxSection($sequence) . PHP_EOL;
echo getMaxSection_2($sequence) . PHP_EOL;
echo getMaxSection_3($sequence) . PHP_EOL;

function getMaxSection(array $sequence): int
{
  $max = 0;
  $itrs = 0;
  for ($i = 0; $i < count($sequence); $i++) {
    for ($j = $i; $j < count($sequence); $j++) {
      $sum = 0;
      for ($k = $i; $k <= $j; $k++) {
        // echo 'k: ' . $k . ' i: ' . $i . ' j: ' . $j . PHP_EOL;
        $sum += $sequence[$k];
        $itrs++;
      }
      $max = max($sum, $max);
      // echo 'sum: ' . $sum . PHP_EOL;
    }
  }

  echo 'iterations: ' . $itrs . PHP_EOL;
  return $max;
}

function getMaxSection_2(array $seq) {
  $max = 0;
  $itrs = 0;
  for ($i = 0; $i < count($seq); $i++) {
    $sum = 0;
    for ($j = $i; $j < count($seq); $j++) {
      $sum += $seq[$j];
      // echo ' i: ' . $i . ' j: ' . $j . PHP_EOL;
      $max = max($sum, $max);
      // echo 'sum: ' . $sum . PHP_EOL;
      $itrs++;
    }
  }

  echo 'iterations: ' . $itrs . PHP_EOL;
  return $max;
}

function getMaxSection_3(array $seq) {
  $max = 0;
  $k = 0;
  $itrs = 0;
  $l = $r = 0;
  for ($i = 0; $i < count($seq); $i++) {
    echo '$i: ' . $i .  ' $seq[$i]: ' . $seq[$i] . ' k: ' . $k . PHP_EOL;
    echo 'max(0, ' . $k . '): ' . max(0, $k) . PHP_EOL;
    $k = max(0, $k) + $seq[$i];
    $max = max($k, $max);
    echo 'k: ' . $k . ' max: ' . $max . PHP_EOL;
    $itrs++;
  }
  echo 'iterations: ' . $itrs . PHP_EOL;
  return $max;
}