// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let zZDetailModel = try? newJSONDecoder().decode(ZZDetailModel.self, from: jsonData)

import Foundation
import RxSwift
import DateToolsSwift
import Moya

// MARK: - ZZDetailModel
class ZZDetailModel: Codable {
    let data: ZZDetailData?
    let success: ZZDetailSuccess?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case success = "success"
    }

    init(data: ZZDetailData, success: ZZDetailSuccess) {
        self.data = data
        self.success = success
    }
    
}

// MARK: - ZZDetailData
class ZZDetailData: Codable {
    let drivers: [ZZDetailDriver]
    let nextBillingDate: Int
    let basePrice: String?
    let carplateNumber: String
    let endTime: Int
    let updatedAt: Int?
    var updatedAtString: String{
        let value = Double(updatedAt ?? 0)
        let date = Date.init(timeIntervalSince1970: value)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let timeStr = formatter.string(from: date)
        
        return "last updated: " + timeStr
    }
    let insuranceExcess: Int
    let help: [ZZDetailHelp]
    let drivenThisMonth: Int
    let totalPerkmRate: String
    let earliestPaymentDueDate: String?
    let totalOutstandingFineCount: String?
    let usageDueThisMonth: Int?
    let price: String
    let model: String
    let id: Int
    let make: String
    let startTime: Int
    var startDate: Date{
        let value = Double(updatedAt ?? 0)
        let date = Date.init(timeIntervalSince1970: value)
        return date
    }
    var totalDays :Int{
        let day =  Date().chunkBetween(date: startDate).days
       return day + (daysLeft ?? 0)
    }
    let hasSubscribedInsurance: Bool
    let daysLeft: Int?
    let mileage: Int?
    let totalOutstandingFineAmount: String?
    let records: [ZZDetailRecord]
    let roadTax: Int
    let type: String

    enum CodingKeys: String, CodingKey {
        case drivers = "drivers"
        case nextBillingDate = "next_billing_date"
        case basePrice = "base_price"
        case carplateNumber = "carplate_number"
        case endTime = "end_time"
        case updatedAt = "updated_at"
        case insuranceExcess = "insurance_excess"
        case help = "help"
        case drivenThisMonth = "driven_this_month"
        case totalPerkmRate = "total_per_km_rate"
        case earliestPaymentDueDate = "earliest_payment_due_date"
        case totalOutstandingFineCount = "total_outstanding_fine_count"
        case usageDueThisMonth = "usage_due_this_month"
        case price = "price"
        case model = "model"
        case id = "id"
        case make = "make"
        case startTime = "start_time"
        case hasSubscribedInsurance = "has_subscribed_insurance"
        case daysLeft = "days_left"
        case mileage = "mileage"
        case totalOutstandingFineAmount = "total_outstanding_fine_amount"
        case records = "records"
        case roadTax = "road_tax"
        case type = "type"
    }

    init(drivers: [ZZDetailDriver], nextBillingDate: Int, basePrice: String?, carplateNumber: String, endTime: Int, updatedAt: Int?, insuranceExcess: Int, help: [ZZDetailHelp], drivenThisMonth: Int, totalPerkmRate: String, earliestPaymentDueDate: String?, totalOutstandingFineCount: String?, usageDueThisMonth: Int, price: String, model: String, id: Int, make: String, startTime: Int, hasSubscribedInsurance: Bool, daysLeft: Int?, mileage: Int?, totalOutstandingFineAmount: String?, records: [ZZDetailRecord], roadTax: Int, type: String) {
        self.drivers = drivers
        self.nextBillingDate = nextBillingDate
        self.basePrice = basePrice
        self.carplateNumber = carplateNumber
        self.endTime = endTime
        self.updatedAt = updatedAt
        self.insuranceExcess = insuranceExcess
        self.help = help
        self.drivenThisMonth = drivenThisMonth
        self.totalPerkmRate = totalPerkmRate
        self.earliestPaymentDueDate = earliestPaymentDueDate
        self.totalOutstandingFineCount = totalOutstandingFineCount
        self.usageDueThisMonth = usageDueThisMonth
        self.price = price
        self.model = model
        self.id = id
        self.make = make
        self.startTime = startTime
        self.hasSubscribedInsurance = hasSubscribedInsurance
        self.daysLeft = daysLeft
        self.mileage = mileage
        self.totalOutstandingFineAmount = totalOutstandingFineAmount
        self.records = records
        self.roadTax = roadTax
        self.type = type
    }
}

// MARK: - ZZDetailDriver
class ZZDetailDriver: Codable {
    let maritalStatus: String
    let phone: String
    let name: String
    let idNumber: String
    let driverType: String
    let drivingExperience: String
    let drivingLicenseRegistrationDate: Int
    let dateOfBirth: Int
    let gender: String
    let drivingLicenseNumber: String

    enum CodingKeys: String, CodingKey {
        case maritalStatus = "marital_status"
        case phone = "phone"
        case name = "name"
        case idNumber = "id_number"
        case driverType = "driver_type"
        case drivingExperience = "driving_experience"
        case drivingLicenseRegistrationDate = "driving_license_registration_date"
        case dateOfBirth = "date_of_birth"
        case gender = "gender"
        case drivingLicenseNumber = "driving_license_number"
    }

    init(maritalStatus: String, phone: String, name: String, idNumber: String, driverType: String, drivingExperience: String, drivingLicenseRegistrationDate: Int, dateOfBirth: Int, gender: String, drivingLicenseNumber: String) {
        self.maritalStatus = maritalStatus
        self.phone = phone
        self.name = name
        self.idNumber = idNumber
        self.driverType = driverType
        self.drivingExperience = drivingExperience
        self.drivingLicenseRegistrationDate = drivingLicenseRegistrationDate
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.drivingLicenseNumber = drivingLicenseNumber
    }
}

// MARK: - ZZDetailHelp
class ZZDetailHelp: Codable {
    let key: String
    let value: String
    let label: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case value = "value"
        case label = "label"
    }

    init(key: String, value: String, label: String) {
        self.key = key
        self.value = value
        self.label = label
    }
}

// MARK: - ZZDetailRecord
class ZZDetailRecord: Codable {
    let key: String
    let label: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case label = "label"
    }

    init(key: String, label: String) {
        self.key = key
        self.label = label
    }
}

// MARK: - ZZDetailSuccess
class ZZDetailSuccess: Codable {
    let message: String

    enum CodingKeys: String, CodingKey {
        case message = "message"
    }

    init(message: String) {
        self.message = message
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



public class ZZDetailControllerModel {
    var network: Single<ZZDetailModel>!
    let country: Country!
    var singaporeTuple = [("Base Price",""),("Road Tax",""),("Usage Based Insurance",""),("Named Drivers",""),("Insurance Excess","")]
    // 删除 usage based insurance/ name drives
    // Add "Total Fines" information
    // Add "Total Fines Amount" information
    var thailandTuple = [("Base Price",""),("Road Tax",""),("Total Fines",""),("Total Fines Amount",""),("Insurance Excess","")]
    var tableTupleArr :[(String, String)]{
        return country == .Singapore ? singaporeTuple : thailandTuple
    }
    init(country: Country) {
        self.country = country
        network = subscriptionProvider.rx.request(.information).catchConnectivityError().flatMap({ resp in
                if resp.statusCode == 200,
                   let root = try? JSONDecoder().decode(ZZDetailModel.self, from: resp.data){
                    return Single.create {[weak self] single in
                        single(.success(root))
                        self?.singaporeTuple[0].1 = "$ " + (root.data?.basePrice ?? "0").moneyOfficialSpell() + " / month"
                        self?.singaporeTuple[1].1 = "$ " + "\(root.data?.roadTax ?? 0)".moneyOfficialSpell()
                        self?.singaporeTuple[4].1 = "$ " + "\(root.data?.insuranceExcess ?? 0)".moneyOfficialSpell()
                        
                        self?.thailandTuple[0].1 = "$ " + (root.data?.basePrice ?? "0").moneyOfficialSpell() + " / month"
                        self?.thailandTuple[1].1 = "$ " + "\(root.data?.roadTax ?? 0)".moneyOfficialSpell()
                        self?.thailandTuple[4].1 = "$ " + "\(root.data?.insuranceExcess ?? 0)".moneyOfficialSpell()
                        
                        if (country == .Singapore){
                            self?.singaporeTuple[2].1 = "$ 0.00 / km"
                            self?.singaporeTuple[3].1 = root.data?.drivers.map({$0.name}).joined(separator: "\n") ?? ""
                        } else {
                            self?.thailandTuple[2].1 = "$ " + (root.data?.totalOutstandingFineCount ?? "0").moneyOfficialSpell()
                            self?.thailandTuple[3].1 = "$ " + (root.data?.totalOutstandingFineAmount ?? "0").moneyOfficialSpell()
                        }
                        return Disposables.create()
                    }
                }
                throw ApiError.invalidData
        })
    }
}
