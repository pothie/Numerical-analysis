%6.5-10
word = 'pneumonoultramicroscopicsilicovolcanoconiosis'

%% a
v = 'aeiou';
vowels = word(ismember(word,v));
all_five = ismember(v, vowels);
disp("All the vowels: " + v(all_five));

%% b
consonants = setdiff(word,vowels);
disp("All the consonants: " + consonants);

%% c
[x,y,z] = unique(word);
X = [];
for i = 1:length(x)
    X = [X sum(ismember(word,x(i)))];
end
T = [x' "   "+X'];
disp("Distinct letters in alphabetical order, followed by the number of times it appears: ");
disp(T);

%% d
consonants_repeat = word(ismember(word,consonants));
disp("No vowels: " + consonants_repeat);

%% i
sentence = 'A pair of pears from poor people are peeking at their peers appropriately on a stack of paper.';
no_vowel = sentence(~ismember(sentence,'aeiou'));
disp("sentence without vowels:" +no_vowel);

