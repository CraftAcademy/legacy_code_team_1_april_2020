features "user can send messages" do 
    let(:sender) {create(:user, email: 'sender@mail.com', password:'wderfhujikki', name:'pauline') }
    let(:receiver) {create(:user, email: 'sender@mail.com',password:' hdjkkkklkk' name:'ali') }
     describe
     
     before do
          login_as(user, scope: :user)
          visit root_path
        end


end