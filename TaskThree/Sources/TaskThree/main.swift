import Foundation
import Alamofire

func findRepositories(by query: String) {
    let urlStr = "https://api.github.com/search/users?q=" + query
    Alamofire.request(urlStr).responseJSON {
        guard let json = $0.result.value,
            let array = json as? [String: AnyObject],
            let items = array["items"] as? [AnyObject],
            let dictionary = items.first as? [String: AnyObject],
            let repoURL = dictionary["repos_url"] as? String
            else {
                print("No Links")
                exit(0)
        }
        Alamofire.request(repoURL).responseJSON {
            guard let json = $0.result.value,
                let array = json as? [Any],
                !array.isEmpty else {
                    print("No Repositories")
                    exit(0)
            }
            array.forEach {
                guard let dictionary = $0 as? [String: AnyObject],
                    let name = dictionary["name"] as? String else { return }
                print("Repository name: \(name)")
            }
        }
    }
}

requestRepos(query: "tom+repos:%3E42+followers:%3E1000")
RunLoop.main.run()
