def generate_permutations(word)
  permutations = ['00000']

  word.each_char do |char|
    tmp_set = []

    permutations.each do |permutation|
      tmp_set += insert_in_all_positions(char, permutation)
    end

    permutations = tmp_set.uniq
  end
  puts "count: #{permutations.size}"
  permutations
end

def insert_in_all_positions(char, word)
  permutation_sets = []
  len = word.length + 1

  index = 0
  while index < len
    permutation_sets << word.split('').insert(index, char).join
    index += 1
  end
  permutation_sets.uniq
end

p generate_permutations('1111111111')


=begin
void permutation(int no_ones, int no_zeroes, string accum){
    if(no_ones == 0){
        for(int i=0;i<no_zeroes;i++){
            accum += "0";
        }

        cout << accum << endl;
        return;
    }
    else if(no_zeroes == 0){
        for(int j=0;j<no_ones;j++){
            accum += "1";
        }

        cout << accum << endl;
        return;
    }

    permutation (no_ones - 1, no_zeroes, accum + "1");
    permutation (no_ones , no_zeroes - 1, accum + "0");
}

int main(){
    string append = "";

    //finding permutation of 11000   
    permutation(2, 6, append);  //the permutations are 

    //11000
    //10100
    //10010
    //10001
    //01100
    //01010

    cin.get(); 
}

=end

