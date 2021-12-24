//
//  LoginDataModel.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/11/11.
//


import Foundation

// MARK: - Login
struct LoginDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: loginData?
}

// MARK: - DataClass
struct loginData: Codable {
    let id: Int
    let name, email: String
}
