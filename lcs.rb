def lcs(str1, str2)
  lcs_compute(str1.split(''),
              str2.split(''),
              str1.length,
              str2.length)
end

def lcs_compute(arr1, arr2, s1, s2)
  return 0 if s1.zero? || s2.zero?

  return 1 + lcs_compute(arr1, arr2, s1 - 1, s2 - 1) if arr1[s1 - 1] == arr2[s2 - 1]

  [lcs_compute(arr1, arr2, s1 - 1, s2),
   lcs_compute(arr1, arr2, s1, s2 - 1)].max
end

puts lcs('AGGTAB', 'GXTXAYB')
puts lcs('ABCDGH', 'AEDFHR')
