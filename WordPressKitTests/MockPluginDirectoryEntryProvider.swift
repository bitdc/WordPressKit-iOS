@testable import WordPressKit

class MockPluginDirectoryProvider {
    static func getPluginDirectoryEntry() -> PluginDirectoryEntry {
        let plugin = PluginDirectoryEntry(name: "Jetpack by WordPress.com",
                                          slug: "jetpack",
                                          version: "5.5.1",
                                          lastUpdated: nil,
                                          icon: URL(string: "https://ps.w.org/jetpack/assets/icon-256x256.png?rev=969908"),
                                          banner: URL(string: "https://ps.w.org//jetpack//assets//banner-1544x500.png?rev=1791404"),
                                          author: "Automattic",
                                          authorURL: URL(string: "https://profiles.wordpress.org/automattic"),
                                          descriptionHTML: self.getJetpackFAQHTML(),
                                          installationHTML: self.getJetpackInstallationHTML(),
                                          faqHTML: self.getJetpackFAQHTML(),
                                          changelogHTML: self.getJetpaackChangeLogHTML(),
                                          rating: 82)


        return plugin
    }

//    static func getPluginDirectoryFeedPage(ofType feedType: PluginDirectoryFeedType) -> PluginDirectoryFeedPage? {
//        var fileName = ""
//
//        switch feedType {
//        case .popular:
//            fileName = "plugin-directory-popular"
//        case .newest:
//            fileName = "plugin-directory-new"
//        default:
//            fileName = ""
//        }
//
//        let feedMockPath = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json")!
//        let data = try! Data(contentsOf: URL(fileURLWithPath: feedMockPath))
//        let endpoint = PluginDirectoryFeedEndpoint(feedType: feedType)
//
//        do {
//            let resonse = try endpoint.parseResponse(data: data)
//            return resonse
//        } catch {
//            return nil
//        }

    static func getJetpackDescriptionHTML() -> String {
        let description = "<p>Keep any WordPress site secure, increase traffic, and engage your readers.</p>\n<h4>Traffic and SEO Tools</h4>\n<p>Traffic is the lifeblood of any website. Jetpack includes:</p>\n<ul>\n<li>[free] Site stats and analytics</li>\n<li>[free] Automatic sharing on Facebook, Twitter, LinkedIn, Tumblr, Reddit, and WhatsApp</li>\n<li>[free] Related posts</li>\n<li>[paid] Search engine optimization tools for Google, Bing, Twitter, Facebook, and WordPress.com</li>\n<li>[paid] Advertising program that includes the best of AdSense, Facebook Ads, AOL, Amazon, Google AdX, and Yahoo</li>\n</ul>\n<h4>Security and Backup Services</h4>\n<p>Stop worrying about data loss, downtime, and hacking. Jetpack provides:</p>\n<ul>\n<li>[free] Brute force attack protection</li>\n<li>[free] Downtime and uptime monitoring</li>\n<li>[free] Secured logins and two-factor authentication</li>\n<li>[paid] Malware scanning, code scanning, and threat resolution</li>\n<li>[paid] Site backups, restores, and migrations</li>\n</ul>\n<h4>Content Creation</h4>\n<p>Add rich, beautifully-presented media &#8212; no graphic design expertise necessary:</p>\n<ul>\n<li>[free] A high-speed CDN for your images</li>\n<li>[free] Carousels, slideshows, and tiled galleries</li>\n<li>[free] Simple embeds from YouTube, Google Documents, Spotify and more</li>\n<li>[free] Sidebar customization including Facebook, Twitter, and RSS feeds</li>\n<li>[free] Extra sidebar widgets including blog stats, calendar, and author widgets</li>\n<li>[paid] High-speed, ad-free, and high-definition video hosting</li>\n</ul>\n<h4>Discussion and Community</h4>\n<p>Create a connection with your readers and keep them coming back to your site with:</p>\n<ul>\n<li>[free] Email subscriptions</li>\n<li>[free] Comment login with Facebook, Twitter, and Google</li>\n<li>[free] Fully-customizable contact forms</li>\n<li>[free] Infinite scroll for your posts</li>\n</ul>\n<h4>Expert Support</h4>\n<p>We have an entire team of Happiness Engineers ready to help you. Ask your questions in the support forum, or <a href=\"https://jetpack.com/contact-support\" rel=\"nofollow\">contact us directly</a>.</p>\n<h4>Paid Services</h4>\n<p>Most of Jetpack&#8217;s features and services are free. Jetpack also provides advanced security and backup services, video hosting, site monetization, priority support, and more SEO tools in three <a href=\"https://jetpack.com/pricing?from=wporg\" rel=\"nofollow\">simple and affordable plans</a>.</p>\n<h4>Get Started</h4>\n<p>Installation is free, quick, and easy. Set up <a href=\"https://jetpack.com/install?from=wporg\" rel=\"nofollow\">the free plan</a> in minutes.</p>\n"
        return description
    }

    static func getJetpackFAQHTML() -> String {
        let faq = "\n<h4>Installation Instructions</h4>\n<p>\n<h4>Automated Installation</h4>\n<p>Installation is free, quick, and easy. <a href=\"https://jetpack.com/install?from=wporg\" rel=\"nofollow\">Install Jetpack from our site</a> in minutes.</p>\n<h4>Manual Alternatives</h4>\n<p>Alternatively, install Jetpack via the plugin directory, or upload the files manually to your server and follow the on-screen instructions. If you need additional help <a href=\"https://jetpack.com/support/installing-jetpack/\" rel=\"nofollow\">read our detailed instructions</a>.</p>\n</p>\n<h4>Is Jetpack Free?</h4>\n<p>\n<p>Yes! Jetpack&#8217;s core features are and always will be free.</p>\n<p>These include: <a href=\"https://jetpack.com/features/traffic/site-stats\" rel=\"nofollow\">site stats</a>, a <a href=\"https://jetpack.com/features/writing/content-delivery-network/\" rel=\"nofollow\">high-speed CDN</a> for images, <a href=\"https://jetpack.com/features/traffic/related-posts\" rel=\"nofollow\">related posts</a>, <a href=\"https://jetpack.com/features/security/downtime-monitoring\" rel=\"nofollow\">downtime monitoring</a>, brute force <a href=\"https://jetpack.com/features/security/brute-force-attack-protection\" rel=\"nofollow\">attack protection</a>, <a href=\"https://jetpack.com/features/traffic/automatic-publishing/\" rel=\"nofollow\">automated sharing</a> to social networks, <a href=\"https://jetpack.com/features/writing/sidebar-customization/\" rel=\"nofollow\">sidebar customization</a>, and many more.</p>\n</p>\n<h4>Should I purchase a paid plan?</h4>\n<p>\n<p>Jetpack&#8217;s paid services include automated backups, security scanning, spam filtering, video hosting, site monetization, SEO tools, and priority support.</p>\n<p>If you&#8217;re interested in learning more about the extra layers of protection and advanced tools available, learn more about our <a href=\"https://jetpack.com/pricing?from=wporg\" rel=\"nofollow\">paid plans</a>.</p>\n</p>\n<h4>Why do I need a WordPress.com account?</h4>\n<p>\n<p>Since Jetpack and its services are provided and hosted by WordPress.com, a WordPress.com account is required for Jetpack to function.</p>\n</p>\n<h4>I already have a WordPress account, but Jetpack isn&#8217;t working. What&#8217;s going on?</h4>\n<p>\n<p>A WordPress.com account is different from the account you use to log into your self-hosted WordPress. If you can log into <a href=\"https://wordpress.com\" rel=\"nofollow\">WordPress.com</a>, then you already have a WordPress.com account. If you can&#8217;t, you can easily create one <a href=\"https://jetpack.com/install?from=wporg\" rel=\"nofollow\">during installation</a>.</p>\n</p>\n<h4>How do I view my stats?</h4>\n<p>\n<p>Once you&#8217;ve installed Jetpack your stats will be available on <a href=\"https://wordpress.com/stats\" rel=\"nofollow\">WordPress.com/Stats</a>, on the official <a href=\"https://apps.wordpress.com/mobile/\" rel=\"nofollow\">WordPress mobile apps</a>, and on your Jetpack dashboard.</p>\n</p>\n<h4>How do I contribute to Jetpack?</h4>\n<p>\n<p>There are opportunities for developers at all levels to contribute. <a href=\"https://jetpack.com/contribute\" rel=\"nofollow\">Learn more about contributing to Jetpack</a> or consider <a href=\"https://jetpack.com/beta\" rel=\"nofollow\">joining our beta program</a>.</p>\n</p>\n\n"
        return faq
    }

    static func getJetpackInstallationHTML() -> String {
        let installation = "<h4>Automated Installation</h4>\n<p>Installation is free, quick, and easy. <a href=\"https://jetpack.com/install?from=wporg\" rel=\"nofollow\">Install Jetpack from our site</a> in minutes.</p>\n<h4>Manual Alternatives</h4>\n<p>Alternatively, install Jetpack via the plugin directory, or upload the files manually to your server and follow the on-screen instructions. If you need additional help <a href=\"https://jetpack.com/support/installing-jetpack/\" rel=\"nofollow\">read our detailed instructions</a>.</p>\n"
        return installation
    }

    static func getJetpaackChangeLogHTML() -> String {
        let log = "<h4>5.5.1</h4>\n<ul>\n<li>Release date: November 21, 2017</li>\n<li>Release post: https://wp.me/p1moTy-6Bd</li>\n</ul>\n<p><strong>Bug fixes</strong><br />\n* In Jetpack 5.5 we made some changes that created errors if you were using other plugins that added custom links to the Plugins menu. This is now fixed.<br />\n* We have fixed a problem that did not allow to upload plugins using API requests.<br />\n* Open Graph links in post headers are no longer invalid in some special cases.<br />\n* We fixed warnings happening when syncing users with WordPress.com.<br />\n* We updated the way the Google+ button is loaded to match changes made by Google, to ensure the button is always displayed properly.<br />\n* We fixed conflicts between Jetpack&#8217;s Responsive Videos and the updates made to Video players in WordPress 4.9.<br />\n* We updated Publicize&#8217;s message length to match Twitter&#8217;s new 280 character limit.</p>\n"
        return log
    }

    static func getJetackLogFistOccurence() -> String {
        let first = ">5.5.1</h4>\n<ul>\n<li>Release date: November 21, 2017</li>\n<li>Release post: https://wp.me/p1moTy-6Bd</li>\n</ul>\n<p><strong>Bug fixes</strong><br />\n* In Jetpack 5.5 we made some changes that created errors if you were using other plugins that added custom links to the Plugins menu. This is now fixed.<br />\n* We have fixed a problem that did not allow to upload plugins using API requests.<br />\n* Open Graph links in post headers are no longer invalid in some special cases.<br />\n* We fixed warnings happening when syncing users with WordPress.com.<br />\n* We updated the way the Google+ button is loaded to match changes made by Google, to ensure the button is always displayed properly.<br />\n* We fixed conflicts between Jetpack&#8217;s Responsive Videos and the updates made to Video players in WordPress 4.9.<br />\n* We updated Publicize&#8217;s message length to match Twitter&#8217;s new 280 character limit.</p>\n"
        return first
    }

}


