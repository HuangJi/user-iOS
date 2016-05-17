//
//  PointTreeClient.swift
//  user-iOS
//
//  Created by Wilson H. on 5/7/16.
//  Copyright © 2016 Jeremy Yang. All rights reserved.
//

import UIKit
import Alamofire

class PointTreeClient: NSObject {

    let ENDPOINT : String = "http://52.196.7.22:8000/"
    let LOGIN_API : String = "%@/api/v1/login"
    let POINTS_API : String = "%@/api/v1/points"
    let REGISTER_API : String = "%@/api/v1/members"
    let MEMBER_PROFILE_API : String = "%@//api/v1/members/%@/profile"
    let FORGET_PASSWORD_API : String = "%@/api/v1/members/%@/password"
    let MEMBER_POINTS_API : String = "%@/api/v1/members/%@/points"
    let MEMBER_BALANCE_API : String = "%@/api/v1/members/%@/balance"
    let MEMBER_TXS_API : String = "%@/api/v1/members/%@/transactions"
    let TRANSFER_POINTS_API : String = "%@/api/v1/points/%@/transfer"
    let AUTHORIZE_CODE_API : String = "%@/api/v1/messages/%@"
    let MINT_POINTS_API : String = "%@/api/v1/points/%@/mint"
    let POINTS_PROFILE_API : String = "%@/api/v1/points/%@/profile"

    func login(sender: AnyObject) {
        Alamofire.request(.POST, String(format: LOGIN_API, ENDPOINT), parameters: ["mobile_number": "+886-988300984", "password": "111111"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidLogin(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidLogin(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appLoginDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appLoginDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func register(sender: AnyObject) {
        Alamofire.request(.POST, String(format: REGISTER_API, ENDPOINT), parameters: ["mobile_number": "+886-988300984", "password": "111111"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidRegister(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidRegister(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appRegisterDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appRegisterDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getMemberProfile(sender :AnyObject) {
        Alamofire.request(.GET, String(format: MEMBER_PROFILE_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetMemberProfile(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetMemberProfile(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetMemberProfileDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetMemberProfileDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func updateMemberProfile(sender: AnyObject) {
        Alamofire.request(.POST, String(format: MEMBER_PROFILE_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: ["name": "大屌融", "image_uri": "https://timmel.files.wordpress.com/2008/05/un-rong-qiu-e982b1e4bf8ae89e8d.jpg"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetMemberProfile(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetMemberProfile(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetMemberProfileDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetMemberProfileDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func forgetPassword(sender: AnyObject) {
        Alamofire.request(.POST, String(format: FORGET_PASSWORD_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: ["mobile_number": "+886-988300984"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidForgetPassword(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidForgetPassword(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appForgetPasswordDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appForgetPasswordDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getMemberPoints(sender :AnyObject) {
        Alamofire.request(.GET, String(format: MEMBER_POINTS_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetMemberPoints(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetMemberPoints(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetMemberPointsDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetMemberPointsDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getMemberBalance(sender: AnyObject) {
        Alamofire.request(.GET, String(format: MEMBER_BALANCE_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetMemberBalance(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetMemberBalance(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetMemberBalanceDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetMemberBalanceDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getMemberTransactions(sender: AnyObject) {
        Alamofire.request(.GET, String(format: MEMBER_TXS_API, ENDPOINT, "acd612daae4d4ea197b13a8dcf310ef8"), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetMemberTransactions(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetMemberTransactions(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetMemberTransactionsDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetMemberTransactionsDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func transferPoints(sender: AnyObject) {
        Alamofire.request(.POST, String(format: TRANSFER_POINTS_API, ENDPOINT, "f3d612daae4d4ea197b13a8dcf310al5"), parameters: ["amount": "100", "comment": "大屌融無敵！"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidTransferPoints(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidTransferPoints(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appTransferPointsDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appTransferPointsDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func authorzieMobileCode(sender: AnyObject) {
        Alamofire.request(.POST, String(format: AUTHORIZE_CODE_API, ENDPOINT, "FWUg0mcOjMY1aydkpesonoK2frCXwZmZ"), parameters: ["code": "111111"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidAuthorzieMobileCode(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidAuthorzieMobileCode(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appAuthorzieMobileCodeDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appAuthorzieMobileCodeDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getPointList(sender: AnyObject) {
        Alamofire.request(.GET, String(format: POINTS_API, ENDPOINT), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetPointList(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetPointList(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetPointListDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetPointListDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func applyNewPoints(sender: AnyObject) {
        Alamofire.request(.POST, String(format: POINTS_API, ENDPOINT), parameters: ["name": "大屌融點", "member_control": "?", "expired_time": "149302013", "image_uri": "https://timmel.files.wordpress.com/2008/05/un-rong-qiu-e982b1e4bf8ae89e8d.jpg"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidApplyNewPoints(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidApplyNewPoints(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appApplyNewPointsDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appApplyNewPointsDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func mintPoints(sender: AnyObject) {
        Alamofire.request(.POST, String(format: MINT_POINTS_API, ENDPOINT, "f3d612daae4d4ea197b13a8dcf310al5"), parameters: ["amount": "100", "comment": "大屌融無敵！"])
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidMintPoints(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidMintPoints(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appMintPointsDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appMintPointsDidFail(_:)), withObject: true)
                    }
                }
        }
    }

    func getPointsDetail(sender: AnyObject) {
        Alamofire.request(.GET, String(format: POINTS_PROFILE_API, ENDPOINT), parameters: nil)
            .responseJSON { response in
                if response.result.isSuccess {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appDidGetPointsDetail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appDidGetPointsDetail(_:)), withObject: true)
                    }
                }
                else {
                    if sender.respondsToSelector(#selector(PointTreeHttpProtocol.appGetPointsDetailDidFail(_:))) {
                        sender.performSelector(#selector(PointTreeHttpProtocol.appGetPointsDetailDidFail(_:)), withObject: true)
                    }
                }
        }
    }
}

@objc protocol PointTreeHttpProtocol : class {
    optional func appDidLogin(data: AnyObject)
    optional func appLoginDidFail(data: AnyObject)
    optional func appDidRegister(data: AnyObject)
    optional func appRegisterDidFail(data: AnyObject)
    optional func appDidGetMemberProfile(data: AnyObject)
    optional func appGetMemberProfileDidFail(data: AnyObject)
    optional func appDidUpdateMemberProfile(data: AnyObject)
    optional func appUpdateMemberProfileDidFail(data: AnyObject)
    optional func appDidForgetPassword(data: AnyObject)
    optional func appForgetPasswordDidFail(data: AnyObject)
    optional func appDidGetMemberPoints(data: AnyObject)
    optional func appGetMemberPointsDidFail(data: AnyObject)
    optional func appDidGetMemberBalance(data: AnyObject)
    optional func appGetMemberBalanceDidFail(data: AnyObject)
    optional func appDidGetMemberTransactions(data: AnyObject)
    optional func appGetMemberTransactionsDidFail(data: AnyObject)
    optional func appDidTransferPoints(data: AnyObject)
    optional func appTransferPointsDidFail(data: AnyObject)
    optional func appDidAuthorzieMobileCode(data: AnyObject)
    optional func appAuthorzieMobileCodeDidFail(data: AnyObject)
    optional func appDidGetPointList(data: AnyObject)
    optional func appGetPointListDidFail(data: AnyObject)
    optional func appDidApplyNewPoints(data: AnyObject)
    optional func appApplyNewPointsDidFail(data: AnyObject)
    optional func appDidMintPoints(data: AnyObject)
    optional func appMintPointsDidFail(data: AnyObject)
    optional func appDidGetPointsDetail(data: AnyObject)
    optional func appGetPointsDetailDidFail(data: AnyObject)
}