import Foundation
import Alamofire

struct RegisterService {
    static let shared = RegisterService()
    
    private func makeParameter(email: String, password: String, name: String) -> Parameters
    {
        return ["email": email,
                "password": password,
                "name": name]
    }
    
    func Register(email: String,
              password: String,
                  name: String,
              completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(Constants.register,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password, name: name),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                
                print("----- 회원가입 데이터 요청 성공")
                guard let statusCode = dataResponse.response?.statusCode else {return}
                print(dataRequest.response?.statusCode)
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        let defaults = UserDefaults.standard
        
        
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data)
        else {
            print("패쓰에러")
            return .pathErr
            
        }
        
        switch statusCode {
        
        case 200:
            print("--- 회원가입 데이터 받기 성공")
            defaults.set(decodedData.data?.name, forKey: "userName")
            return .success(decodedData)
        case 400: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    
}
