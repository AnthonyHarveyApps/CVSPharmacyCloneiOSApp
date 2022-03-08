//
//  CreateAccountView.swift
//  CVS Clone
//
//  Created by Anthony Harvey on 3/7/22.
//

import SwiftUI


struct CreateAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var mobileNumber: String = ""

    let validator = CreateAccountModelValidator()
    
    @State var correctionsNeeded: Bool = false
    @State var emailInvalid: Bool = false
    @State var firstNameInvalid: Bool = false
    @State var lastNameInvalid: Bool = false
    @State var passwordInvalid: Bool = false
    @State var isCreatingNewAccount = false
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            ZStack(alignment: .leading) {
                                Image(systemName: "heart.fill").foregroundColor(Color(CVSRed))
                                    .font(.system(size: 85))
                                Image(systemName: "person.fill").foregroundColor(.black)
                                    .font(.system(size: 60))
                            }
                            Spacer()
                        }.padding(.vertical)
                        
                        Text("Let's create your")
                            .font(.largeTitle).bold()
                        
                        Text("CVS.com account")
                            .font(.largeTitle).bold().foregroundColor(.teal)
                        
                        
                        HStack {
                            Text("Already have an account?")
                            Text("Sign in")
                                .underline().bold().foregroundColor(.red)
                                .onTapGesture {
                                    // Sign in Screen here
                                }
                        }.padding(.top)

                        if correctionsNeeded {
                            
                            HStack {
                                VStack {
                                    Image(systemName: "exclamationmark.triangle").foregroundColor(.white).padding()
                                    Spacer()
                                }.background(Color(CVSRed))
                                
                                VStack(alignment: .leading) {
                                    Text("Please correct the following error(s):").bold()
                                    
                                    if emailInvalid {
                                        Text("Enter a valid email address").font(.subheadline).foregroundColor(.red).underline()
                                            .padding(.top)
                                    }
                                    if firstNameInvalid {
                                        Text("Enter a first name").font(.subheadline).foregroundColor(.red).underline()
                                            .padding(.top)
                                    }
                                    if lastNameInvalid {
                                        Text("Enter a last name").font(.subheadline).foregroundColor(.red).underline()
                                            .padding(.top)
                                    }
                                    if passwordInvalid {
                                        Text("Enter a valid password").font(.subheadline).foregroundColor(.red).underline()
                                            .padding(.vertical)
                                    }
                                    
                                }.padding()
                                Spacer()
                            }.frame(width: UIScreen.width - 38)
                                .border(Color.black, width: 2)
                        }
                        
                        Text("All fields are required unless marked optional")
                            .font(.footnote).foregroundColor(.gray).padding(.top)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Email address").bold().padding(.top)
                        TextField("", text: $email)
                            .textFieldStyle(.roundedBorder)
                        Text("First name").bold()
                        TextField("", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("Last name").bold()
                        TextField("", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(alignment: .leading) {
                        Text("Password requirements").bold().padding(.top)
                        HStack(alignment: .top) {
                            Text("• ").bold()
                            Text("Must be 8 to 64 characters")
                        }
                        HStack(alignment: .top) {
                            Text("• ").bold()
                            Text("Must include at least 1 number and 1 letter")
                        }
                        HStack(alignment: .top) {
                            Text("• ").bold()
                            Text("Can't be your username or easily guessed words like \"password.\"")
                        }
                        
                    }.padding(.bottom)
                    
                    Text("Create a password").bold().padding(.top)
                    SecureField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.top)
                    
                    Text("Mobile number (optional)").bold().padding(.top)
                    TextField("", text: $mobileNumber)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Terms of Use")
                        Text("|").bold()
                        Text("Privacy Policy")
                    }.font(.caption).foregroundColor(.red).padding(.top)
                    
                    Text("By creating an account, you agree to the CVS Pharmacy® Terms of Use and Privacy Policy .....Actually this isn't the real app. it's just a clone app made by Anthony Harvey to practice and provide a code sample").font(.footnote).foregroundColor(.black).padding(.top)
                    
                    HStack {
                        Spacer()
                        Button {
                            self.hideKeyBoard()
                            if validateAllFields() {
                                submitForNewAccount()
                            }
                        } label: {
                            Text("Create your account").foregroundColor(.white)
                                .frame(width: UIScreen.width * 0.70)
                                .padding()
                        }.buttonStyle(.borderedProminent).foregroundColor(Color(CVSRed))
                            .padding(.vertical)
                        
                        Spacer()
                    }
                }.foregroundColor(.black)
                    .padding()
            }

            if isCreatingNewAccount {
                ZStack {
                    Color(CVSRed).edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        HStack(alignment: .bottom,spacing: 0) {
                            Text("CVS")
                                .font(Font.system(size: 20, weight: .heavy))
                            Text("Pharmacy®")
                                .font(Font.system(size: 14, weight: .bold))
                            Text(" Clone App made in")
                            Text(" SwiftUI")
                                .font(Font.system(size: 20, weight: .heavy))
                        }
                        Text("does not actually reach out to an API, and does not create an account. The view will reset shortly!")
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                        Spacer()
                        Text("This was made for practice and as a code sample by Anthony Harvey.\nIt is NOT endorsed by or affiliated with CVS Pharmacy").multilineTextAlignment(.center)
                        Spacer()
                    }.foregroundColor(.white)
                        .padding()
                }
            }
  
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Create an account")
                    .bold()
                    .foregroundColor(.white)
            }
            
            ToolbarItem(placement: .navigation) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left").foregroundColor(.white)
                }
            }
        }
    }
    
    func validateAllFields() -> Bool {
        resetCorrectionsNeeded()
        
        var canSubmit = true
        if !validator.isFirstNameValid(firstName: firstName) {
            print("FM")
            correctionsNeeded = true
            firstNameInvalid = true
            canSubmit = false
        } else {
            firstNameInvalid = false
        }
        
        if !validator.isLastNameValid(lastName: lastName) {
            print("LM")
            correctionsNeeded = true
            lastNameInvalid = true
            canSubmit = false
        } else {
            lastNameInvalid = false
        }
        
        if !validator.isValidEmailFormat(email: email) {
            print("EM")
            correctionsNeeded = true
            emailInvalid = true
            canSubmit = false
        } else {
            emailInvalid = false
        }
        
        if !validator.isPasswordValid(password: password) {
            print("PW")
            correctionsNeeded = true
            passwordInvalid = true
            canSubmit = false
        } else {
            passwordInvalid = false
        }
        
        return canSubmit
    }
    
    
    func resetCorrectionsNeeded() {
        correctionsNeeded = false
        firstNameInvalid = false
        lastNameInvalid = false
        emailInvalid = false
        passwordInvalid = false
    }
    
    
    func submitForNewAccount() {
        print("Here is where I would check with API if email is already used, and create an account if not")
        isCreatingNewAccount = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            isCreatingNewAccount = false
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}

