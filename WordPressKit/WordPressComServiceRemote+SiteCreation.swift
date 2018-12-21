
import Foundation

// MARK: - SiteCreationRequest

/// This value type is intended to express a site creation request.
///
public struct SiteCreationRequest: Encodable {
    let segmentIdentifier: Int64
    let verticalIdentifier: String?
    let title: String
    let tagline: String?
    let siteURLString: String
    let isPublic: Bool
    let languageIdentifier: String
    let shouldValidate: Bool
    let clientIdentifier: String
    let clientSecret: String

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(clientIdentifier, forKey: .clientIdentifier)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(languageIdentifier, forKey: .languageIdentifier)
        try container.encode(shouldValidate, forKey: .shouldValidate)
        try container.encode(siteURLString, forKey: .siteURLString)
        try container.encode(title, forKey: .title)

        let publicValue = isPublic ? 1 : 0
        try container.encode(publicValue, forKey: .isPublic)

        let siteInfo: SiteInformation?
        if let tagline = tagline {
            siteInfo = SiteInformation(tagline: tagline)
        } else {
            siteInfo = nil
        }
        let options = SiteCreationOptions(segmentIdentifier: segmentIdentifier, verticalIdentifier: verticalIdentifier, siteInformation: siteInfo)

        try container.encode(options, forKey: .options)
    }

    private enum CodingKeys: String, CodingKey {
        case clientIdentifier   = "client_id"
        case clientSecret       = "client_secret"
        case languageIdentifier = "lang_id"
        case isPublic           = "public"
        case shouldValidate     = "validate"
        case siteURLString      = "blog_name"
        case title              = "blog_title"
        case options            = "options"
    }
}

private struct SiteCreationOptions: Encodable {
    let segmentIdentifier: Int64
    let verticalIdentifier: String?
    let siteInformation: SiteInformation?

    enum CodingKeys: String, CodingKey {
        case segmentIdentifier  = "site_segment"
        case verticalIdentifier = "site_vertical"
        case siteInformation    = "site_information"
    }
}

private struct SiteInformation: Encodable {
    let tagline: String?

    enum CodingKeys: String, CodingKey {
        case tagline = "site_tagline"
    }
}

// MARK: - SiteCreationResponse

/// This value type is intended to express a site creation response.
///
public struct SiteCreationResponse: Decodable {
    struct CreatedSite: Decodable {
        let identifier: String
        let title: String
        let urlString: String
        let xmlrpcString: String

        enum CodingKeys: String, CodingKey {
            case identifier     = "blogid"
            case title          = "blogname"
            case urlString      = "url"
            case xmlrpcString   = "xmlrpc"
        }
    }
    
    let createdSite: CreatedSite
    let success: Bool

    enum CodingKeys: String, CodingKey {
        case createdSite = "blog_details"
        case success
    }
}

// MARK: - WordPressComServiceRemote (Site Creation)

/// Describes the errors that could arise during the process of site creation.
///
/// - requestEncodingFailure:   unable to encode the request parameters.
/// - responseDecodingFailure:  unable to decode the server response.
/// - serviceFailure:           the service returned an unexpected error.
///
public enum SiteCreationError: Error {
    case requestEncodingFailure
    case responseDecodingFailure
    case serviceFailure
}

/// Advises the caller of results related to site creation requests.
///
/// - success: the site creation request succeeded with the accompanying result.
/// - failure: the site creation request failed due to the accompanying error.
///
public enum SiteCreationResult {
    case success(SiteCreationResponse)
    case failure(SiteCreationError)
}

public typealias SiteCreationResultHandler = ((SiteCreationResult) -> ())

/// Site creation services, exclusive to WordPress.com.
/// 
public extension WordPressComServiceRemote {
    
    /// Initiates a request to create a new WPCOM site.
    ///
    /// - Parameters:
    ///   - request:    the value object with which to compose the request.
    ///   - completion: a closure including the result of the site creation attempt.
    ///
    func createWPComSite(request: SiteCreationRequest, completion: @escaping SiteCreationResultHandler) {

        let endpoint = "sites/new"
        let path = self.path(forEndpoint: endpoint, withVersion: ._1_1)

        let requestParameters: [String : AnyObject]
        do {
            requestParameters = try encodeRequestParameters(request: request)
        } catch {
            DDLogError("Failed to encode \(SiteCreationRequest.self) : \(error)")

            completion(.failure(SiteCreationError.requestEncodingFailure))
            return
        }

        wordPressComRestApi.POST(
            path,
            parameters: requestParameters,
            success: { [weak self] responseObject, httpResponse in
                DDLogInfo("\(responseObject) | \(String(describing: httpResponse))")

                guard let self = self else {
                    return
                }

                do {
                    let response = try self.decodeResponse(responseObject: responseObject)
                    completion(.success(response))
                } catch {
                    DDLogError("Failed to decode \(SiteCreationResponse.self) : \(error.localizedDescription)")
                    completion(.failure(SiteCreationError.responseDecodingFailure))
                }
        },
            failure: { error, httpResponse in
                DDLogError("\(error) | \(String(describing: httpResponse))")
                completion(.failure(SiteCreationError.serviceFailure))
        })
    }
}

// MARK: - Serialization support

private extension WordPressComServiceRemote {

    func encodeRequestParameters(request: SiteCreationRequest) throws -> [String : AnyObject] {

        let encoder = JSONEncoder()

        let jsonData = try encoder.encode(request)
        let serializedJSON = try JSONSerialization.jsonObject(with: jsonData, options: [])

        let requestParameters: [String : AnyObject]
        if let jsonDictionary = serializedJSON as? [String : AnyObject] {
            requestParameters = jsonDictionary
        } else {
            requestParameters = [:]
        }

        return requestParameters
    }

    func decodeResponse(responseObject: AnyObject) throws -> SiteCreationResponse {

        let decoder = JSONDecoder()

        let data = try JSONSerialization.data(withJSONObject: responseObject, options: [])
        let response = try decoder.decode(SiteCreationResponse.self, from: data)

        return response
    }
}
