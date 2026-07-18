require "language/node"

class Scaffold < Formula
  desc "AI-powered software project scaffolding pipeline"
  homepage "https://github.com/zigrivers/scaffold"
  url "https://github.com/zigrivers/scaffold/archive/refs/tags/v3.47.0.tar.gz"
  sha256 "6611eba2639509d38c00040809b150e7a6f617439b22ca9fe61f7ab33a3f6e00"
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
