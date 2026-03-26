require "language/node"

class Scaffold < Formula
  desc "AI-powered software project scaffolding pipeline"
  homepage "https://github.com/zigrivers/scaffold"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v2.3.5.tar.gz"
  sha256 "48a04567e6d92d7ef2b77df06903a85e2aadbc932bc4238d21572f723fe52d38"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "scaffold", shell_output("#{bin}/scaffold version")
  end
end
