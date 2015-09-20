require 'rails_helper'

describe Vote do
 def valid?
   (@vote == 1) || (@vote == -1)
 end
   describe "validations" do
   before do
     let(:good_v) { Vote.new(value: 1) }
     let(:bad_v) { Vote.new(value: -1) }
     let(:no_v) { Vote.new(value:  2) }
   end
     describe "value validation" do
       it "only allows -1 or 1 as values" do
        # your expectations here
        
         expect(good_vote.valid?).to eq(true) 
         expext(bad_vote.valid?).to eq(true)
        expect(no_vote.valid?).to eq(false)
       end
     end
   end

   describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
 end
