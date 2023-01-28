//
//  JoinMSViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit
import Then
import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
import AuthenticationServices
import NaverThirdPartyLogin
import Alamofire

class JoinMSViewController: UIViewController{
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let loginText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.text = "회원가입"
        $0.textColor = .black
    }
    let startText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 24)
        $0.text = "회원가입하고 편하게\n하루스픽을 이용해보세요!"
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let emailLogin = UIButton(type: .system).then{
        $0.setTitle("이메일 주소로 계속하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .mainColor
    }
    let KakaoTalkLogin = UIButton(type: .system).then{
        $0.setTitle("카카오톡으로 계속하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .KakaoColor
    }
    let AppleLogin = UIButton(type: .system).then{
        $0.setTitle("Apple로 계속하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .black
    }
    let NaverLogin = UIButton(type: .system).then{
        $0.setTitle("Naver로 계속하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.backgroundColor = .NaverColor
    }
    let GoogleLogin = UIButton(type: .system).then{
        $0.setTitle("구글 계정으로 계속하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
    }
    let login = UILabel().then{
        $0.text = "이미 계정이 있으신가요? 바로 로그인"
        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
        $0.textColor = .lightGray
    }
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        naverLoginInstance?.delegate = self
        setupView()
        setupLayout()
        addTarget()
        let attributedStr = NSMutableAttributedString(string: login.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainColor, range: (login.text! as NSString).range(of: "바로 로그인"))
        login.attributedText = attributedStr
    }
    
    //MARK: - Selector
    @objc func arrowLeftButtonTapped(){
        dismiss(animated: true)
    }
    
    @objc func emailLoginButtonTapped(){
        let VC = MembershipViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
        }
    
    @objc func googleLoginButtonTapped(){
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        guard error == nil else { return }
        guard let signInResult = signInResult else { return }

        let user = signInResult.user
        let emailAddress = user.profile?.email
        let fullName = user.profile?.name
        print(user)
        print(emailAddress)
        print(fullName)
        }

        // If sign in succeeded, display the app's main content View.
    }
    
    @objc func kakaoLoginButtonTapped(){
        // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            //카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 톡으로 로그인 성공")
                    
                    _ = oauthToken
                    /// 로그인 관련 메소드 추가
                }
            }
        } else {

            // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                }
            }
        }
    }
    
    @objc func appleLoginButtonTapped(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
                let request = appleIDProvider.createRequest()
                request.requestedScopes = [.fullName, .email]
                
                let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                authorizationController.delegate = self
                authorizationController.presentationContextProvider = self
                authorizationController.performRequests()
    }
    
    @objc func naverLoginButtonTapped(){
        naverLoginInstance?.requestThirdPartyLogin()
        naverLoginPaser()
    }
    
    func naverLoginPaser() {
        guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
              
        if !accessToken {
            return
        }
        guard let tokenType = naverLoginInstance?.tokenType else { return }
        guard let accessToken = naverLoginInstance?.accessToken else { return }
                
        let requestUrl = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: requestUrl)!
              
        let authorization = "\(tokenType) \(accessToken)"
              
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
              
        req.responseJSON { response in
            guard let body = response.value as? [String: Any] else { return }
                  
            if let resultCode = body["message"] as? String{
                if resultCode.trimmingCharacters(in: .whitespaces) == "success"{
                    let resultJson = body["response"] as! [String: Any]
                          
                    let name = resultJson["name"] as? String ?? ""
                    let id = resultJson["id"] as? String ?? ""
//                          let phone = resultJson["mobile"] as! String
//                          let gender = resultJson["gender"] as? String ?? ""
//                          let birthyear = resultJson["birthyear"] as? String ?? ""
//                          let birthday = resultJson["birthday"] as? String ?? ""
//                          let profile = resultJson["profile_image"] as? String ?? ""
                    let email = resultJson["email"] as? String ?? ""
//                          let nickName = resultJson["nickname"] as? String ?? ""

                    print("네이버 로그인 이름 ",name)
                    print("네이버 로그인 아이디 ",id)
//                          print("네이버 로그인 핸드폰 ",phone)
//                          print("네이버 로그인 성별 ",gender)
//                          print("네이버 로그인 생년 ",birthyear)
//                          print("네이버 로그인 생일 ",birthday)
//                          print("네이버 로그인 프로필사진 ",profile)
                    print("네이버 로그인 이메일 ",email)
//                          print("네이버 로그인 닉네임 ",nickName)
                }
            else{
                          //실패
                    }
                }
            }
        }
    
    
    
    
    @objc func loginButtonTapped(){
        let VC = AuthenticationViewController()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true)
    }
        
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.loginText)
            self.view.addSubview(self.startText)
            self.view.addSubview(self.emailLogin)
            self.view.addSubview(self.KakaoTalkLogin)
            self.view.addSubview(self.AppleLogin)
            self.view.addSubview(self.NaverLogin)
            self.view.addSubview(self.GoogleLogin)
            self.view.addSubview(self.login)


        }
    
    //MARK: - Layout
    private func setupLayout(){
        self.arrowLeft.snp.makeConstraints{
            $0.top.equalTo(self.view.snp.top).offset(55)
            $0.leading.equalTo(self.view.snp.leading).offset(16)
            $0.width.equalTo(28)
            $0.height.equalTo(28)
        }
        self.loginText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(61)
            
        }
        self.startText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(158)
        }
        
        self.emailLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.snp.top).offset(255)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.KakaoTalkLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.emailLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.AppleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.KakaoTalkLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.NaverLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.AppleLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        self.GoogleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.NaverLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.login.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.GoogleLogin.snp.bottom).offset(19)
        }
        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
        self.emailLogin.addTarget(self, action: #selector(self.emailLoginButtonTapped), for: .touchUpInside)
        self.GoogleLogin.addTarget(self, action: #selector(self.googleLoginButtonTapped), for: .touchUpInside)
        self.KakaoTalkLogin.addTarget(self, action: #selector(self.kakaoLoginButtonTapped), for: .touchUpInside)
        self.AppleLogin.addTarget(self, action: #selector(self.appleLoginButtonTapped), for: .touchUpInside)
        self.NaverLogin.addTarget(self, action: #selector(self.naverLoginButtonTapped), for: .touchUpInside)
        let loginBtn = UITapGestureRecognizer(target: self, action: #selector(loginButtonTapped))
        login.isUserInteractionEnabled = true
        login.addGestureRecognizer(loginBtn)
    }
    
}

//MARK: - Extension Apple & Naver
extension JoinMSViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate, NaverThirdPartyLoginConnectionDelegate{
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("네이버 로그인 성공")
        self.naverLoginPaser()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("네이버 토큰\(naverLoginInstance?.accessToken)")
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        print("네이버 로그아웃")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let idToken = appleIDCredential.identityToken!
            let tokeStr = String(data: idToken, encoding: .utf8)
         
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            print("token : \(String(describing: tokeStr))")
            
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}
