%6.5-10
function y = no_vowel_sen(s)
    no_vowel = s(~ismember(s,'aeiou'));
    y = "sentence without vowels: " +no_vowel;
end