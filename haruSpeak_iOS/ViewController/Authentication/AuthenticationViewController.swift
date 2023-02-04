//
//  AuthenticationViewController.swift
//  haruSpeak_iOS
//
//  Created by 강예은 on 2023/01/13.
//

import Foundation
import UIKit
import SnapKit
import Then
//import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
import AuthenticationServices
//import NaverThirdPartyLogin
import Alamofire

import SafariServices

class AuthenticationViewController: UIViewController{
    
    //MARK: - DATASOURCE
    
    var KakaoAccessCode : String = ""
    var KakaoRefreshCode : String = ""
    
    
    
    //MARK: - Properties
    let arrowLeft = UIButton(type: .system).then{
        $0.setTitle("arrowLeft", for: .normal)
        $0.setImage(UIImage(named: "arrowLeft")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    let loginText = UILabel().then{
        $0.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
        $0.text = "로그인"
        $0.textColor = .black
    }
    
//    let emailLogin = UIButton(type: .system).then{
//        $0.setTitle("이메일 주소로 계속하기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
//        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
//        $0.backgroundColor = .mainColor
//    }
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
//    let NaverLogin = UIButton(type: .system).then{
//        $0.setTitle("Naver로 계속하기", for: .normal)
//        $0.setTitleColor(.white, for: .normal)
//        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
//        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
//        $0.backgroundColor = .NaverColor
//    }
//    let GoogleLogin = UIButton(type: .system).then{
//        $0.setTitle("구글 계정으로 계속하기", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.titleLabel?.font = UIFont(name:"appleSDGothicNeo-Bold", size: 16)
//        $0.roundCorners(cornerRadius: 6, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor = UIColor.systemGray4.cgColor
//    }
//    let joinMembership = UILabel().then{
//        $0.text = "아직 계정이 없나요? 회원가입 하기"
//        $0.font = UIFont(name:"appleSDGothicNeo-Semibold", size: 13)
//        $0.textColor = .lightGray
//    }
//    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        naverLoginInstance?.delegate = self
        setupView()
        setupLayout()
        addTarget()
//        let attributedStr = NSMutableAttributedString(string: joinMembership.text!)
//        attributedStr.addAttribute(.foregroundColor, value: UIColor.gray, range: (joinMembership.text! as NSString).range(of: "회원가입 하기"))
//        joinMembership.attributedText = attributedStr
        
    }
    
    //MARK: - Selector
    @objc func arrowLeftButtonTapped(){
        dismiss(animated: true)
    }
//
//    @objc func emailLoginButtonTapped(){
//        let VC = EmailLoginViewController()
//        VC.modalPresentationStyle = .fullScreen
//        present(VC, animated: true)
//        }
//
//    @objc func googleLoginButtonTapped(){
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
//        guard error == nil else { return }
//        guard let signInResult = signInResult else { return }
//
//        let user = signInResult.user
//        let emailAddress = user.profile?.email
//        let fullName = user.profile?.name
//        print(user)
//        print(emailAddress)
//        print(fullName)
//        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
//        }
//
//        // If sign in succeeded, display the app's main content View.
//    }
    
    @objc func kakaoLoginButtonTapped(){
        // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
              
                if let error = error {
                    print(error)
                }
                else {
                    
                    print("loginWithKakaoTalk() success.")
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success.")
                            // 사용자 액세스 토큰 정보 조회
                            UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
                                if let error = error {
                                    print(error)
                                }
                                else {
                                    print(accessTokenInfo)

                                    //do something
                                    _ = accessTokenInfo
                                }
                            }
                            //로그인 기록이 있으면
                            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
                            //새로운 유저라면
                            // --> UserSetting 나오게 해야함 (쟨 dismiss하고 Home에서 구현해야할듯)
                            
                            
                            //do something
                            _ = user
                            
                            
                            
                        }
                    }

                    //do something
                    _ = oauthToken
                }
            }
            
        } else {

            // 카톡 없으면 -> 계정으로 로그인

            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        UserApi.shared.me() {(user, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                let accessToken = oauthToken?.accessToken
                                let refreshToken = oauthToken?.refreshToken
                                
                                self.KakaoAccessCode = accessToken!
                                self.KakaoRefreshCode = refreshToken!
                                
                                UserDefaults.standard.setValue(self.KakaoAccessCode, forKey: "KakaoAccessCode")
                                
                                KakaoLoginRequestFile().getRequestData(self)
                                
                                print("me() success.")
                                let OnboardingVC = FirstViewController()
                                OnboardingVC.modalPresentationStyle = .fullScreen
                                self.present(OnboardingVC, animated: false)
                                
                                //do something
                                _ = user
                            }
                        }

                        //do something
                        _ = oauthToken
                    }
            }
        }
    }
    
    
//    // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
//      UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//        if let error = error {
//            // 예외 처리 (로그인 취소 등)
//            print(error)
//        }
//        else {
//            print("loginWithKakaoTalk() success.")
//           // do something
//            _ = oauthToken
//           // 어세스토큰
//           let accessToken = oauthToken?.accessToken
//            print("accessToken")
//            print(accessToken)
//            print("accessToken")
//        }
//    }
    @objc func appleLoginButtonTapped(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
                
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
//
//    @objc func naverLoginButtonTapped(){
//        naverLoginInstance?.requestThirdPartyLogin()
//        naverLoginPaser()
//    }
//
//    func naverLoginPaser() {
//        guard let accessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
//
//        if !accessToken {
//            return
//        }
//        guard let tokenType = naverLoginInstance?.tokenType else { return }
//        guard let accessToken = naverLoginInstance?.accessToken else { return }
//
//        let requestUrl = "https://openapi.naver.com/v1/nid/me"
//        let url = URL(string: requestUrl)!
//
//        let authorization = "\(tokenType) \(accessToken)"
//
//        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
//
//        req.responseJSON { response in
//            guard let body = response.value as? [String: Any] else { return }
//
//            if let resultCode = body["message"] as? String{
//                if resultCode.trimmingCharacters(in: .whitespaces) == "success"{
//                    let resultJson = body["response"] as! [String: Any]
//
//                    let name = resultJson["name"] as? String ?? ""
//                    let id = resultJson["id"] as? String ?? ""
//                    //                          let phone = resultJson["mobile"] as! String
//                    //                          let gender = resultJson["gender"] as? String ?? ""
//                    //                          let birthyear = resultJson["birthyear"] as? String ?? ""
//                    //                          let birthday = resultJson["birthday"] as? String ?? ""
//                    //                          let profile = resultJson["profile_image"] as? String ?? ""
//                    let email = resultJson["email"] as? String ?? ""
//                    //                          let nickName = resultJson["nickname"] as? String ?? ""
//
//                    print("네이버 로그인 이름 ",name)
//                    print("네이버 로그인 아이디 ",id)
//                    //                          print("네이버 로그인 핸드폰 ",phone)
//                    //                          print("네이버 로그인 성별 ",gender)
//                    //                          print("네이버 로그인 생년 ",birthyear)
//                    //                          print("네이버 로그인 생일 ",birthday)
//                    //                          print("네이버 로그인 프로필사진 ",profile)
//                    print("네이버 로그인 이메일 ",email)
//                    //                          print("네이버 로그인 닉네임 ",nickName)
//
//                }
//                else{
//                    //실패
//                }
//
//            }
//        }
//        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
//
//    }
//
//
    
//    @objc func joinMembershipButtonTapped(){
//        let VC = MembershipViewController()
//        VC.modalPresentationStyle = .fullScreen
//        present(VC, animated: true)
//    }
        
    @objc func didClickGoHome(){
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func didClickTestButton(){
        print("didClickTestButton")
        
        if let url = URL(string: "https://kauth.kakao.com/oauth/authorize?client_id=9a859088c85984edc80c3356ed0a41f3&redirect_uri=https://api.haru-speak.site/login/kakao&response_type=code") {
            UIApplication.shared.open(url)
        }
        
//        guard let url = URL(string: "https://kauth.kakao.com/oauth/authorize?client_id=9a859088c85984edc80c3356ed0a41f3") else { return }
//        let safariViewController = SFSafariViewController(url: url)
//        present(safariViewController, animated: true, completion: nil)


        
    }
    
    
    //MARK: - addSubView
        private func setupView(){
            self.view.addSubview(self.arrowLeft)
            self.view.addSubview(self.loginText)
//            self.view.addSubview(self.emailLogin)
            self.view.addSubview(self.KakaoTalkLogin)
            self.view.addSubview(self.AppleLogin)
//            self.view.addSubview(self.NaverLogin)
//            self.view.addSubview(self.GoogleLogin)
//            self.view.addSubview(self.joinMembership)
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
            
        
//        self.emailLogin.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.view.snp.top).offset(255)
//            $0.width.equalTo(333)
//            $0.height.equalTo(45)
//        }
//
        self.KakaoTalkLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.loginText.snp.bottom).offset(255)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
        self.AppleLogin.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.KakaoTalkLogin.snp.bottom).offset(15)
            $0.width.equalTo(333)
            $0.height.equalTo(45)
        }
        
//        self.NaverLogin.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.AppleLogin.snp.bottom).offset(15)
//            $0.width.equalTo(333)
//            $0.height.equalTo(45)
//        }
//        self.GoogleLogin.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.NaverLogin.snp.bottom).offset(15)
//            $0.width.equalTo(333)
//            $0.height.equalTo(45)
//        }
        
//        self.joinMembership.snp.makeConstraints{
//            $0.centerX.equalToSuperview()
//            $0.top.equalTo(self.AppleLogin.snp.bottom).offset(19)
//        }

        
    }
    
//MARK: - AddTarget
    private func addTarget(){
        self.arrowLeft.addTarget(self, action: #selector(self.arrowLeftButtonTapped), for: .touchUpInside)
//        self.emailLogin.addTarget(self, action: #selector(self.emailLoginButtonTapped), for: .touchUpInside)
//        self.GoogleLogin.addTarget(self, action: #selector(self.googleLoginButtonTapped), for: .touchUpInside)
        self.KakaoTalkLogin.addTarget(self, action: #selector(self.kakaoLoginButtonTapped), for: .touchUpInside)
        self.AppleLogin.addTarget(self, action: #selector(self.appleLoginButtonTapped), for: .touchUpInside)
//        self.NaverLogin.addTarget(self, action: #selector(self.naverLoginButtonTapped), for: .touchUpInside)
//        let joinMSBtn = UITapGestureRecognizer(target: self, action: #selector(joinMembershipButtonTapped))
//        joinMembership.isUserInteractionEnabled = true
//        joinMembership.addGestureRecognizer(joinMSBtn)

    }
    
}

//MARK: - Extension Apple
extension AuthenticationViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate{
    
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

////MARK: - Extension Naver
//extension AuthenticationViewController : NaverThirdPartyLoginConnectionDelegate{
//    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
//        print("네이버 로그인 성공")
//        self.naverLoginPaser()
//    }
//
//    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
//        print("네이버 토큰\(naverLoginInstance?.accessToken)")
//    }
//
//    func oauth20ConnectionDidFinishDeleteToken() {
//        print("네이버 로그아웃")
//    }
//
//    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
//        print("에러 = \(error.localizedDescription)")
//    }
//}

extension AuthenticationViewController{
    func didSuccess(_ response: KakaoLoginResponseFile){
        print("AuthenticationViewController hello")
        var haruSpeakAccessToken = response.data?.accessToken
        var haruSpeakRefreshToken = response.data?.refreshToken
        var userEmail = response.data?.email
        var userMemberID = response.data?.memberId
        var newbieBool = response.data?.newbie
        var userNickname = response.data?.nickname
        
        UserDefaults.standard.setValue("\(haruSpeakAccessToken!)", forKey: "haruSpeakAccessToken")
        UserDefaults.standard.setValue("\(haruSpeakRefreshToken!)", forKey: "haruSpeakRefreshToken")
        UserDefaults.standard.setValue("\(userEmail!)", forKey: "userEmail")
        UserDefaults.standard.setValue("\(userMemberID!)", forKey: "userMemberID")
        UserDefaults.standard.setValue("\(newbieBool!)", forKey: "newbieBool")
        UserDefaults.standard.setValue("\(userNickname!)", forKey: "userNickname")

        print("AuthenticationViewController hello")
    }
}
