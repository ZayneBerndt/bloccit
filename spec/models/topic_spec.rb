describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create # default is public
       @private_topic = Topic.create(public: false)
     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_viewable).to eq( [@public_topic] )
       end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
         expect(Topic.privately_viewable).to eq( [@privately_viewable] )
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = User.new
         expect(user).to be_present
       end
 
       it "returns only public topics if user is nil" do
         expect( user: false ).to be_nil
       end
     end
   end
 end