class Tabiew < Formula
    desc "Tabiew is a lightweight, terminal-based application to view and query delimiter separated value formatted documents, such as CSV and TSV files."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.6.1.tar.gz"
    version "0.6.1"
    license "MIT"
    sha256 "2f7e13e27f0e8cf7c9b135d1c7480a65b6ad86c3f984205854051c6dbbeba97c"
  
    depends_on "rust" => :build
  
    def install
        system "cargo", "build", "--release"
        bin.install "target/release/tw"
        man1.install "target/manual/tabiew.1" => "tw.1"
        bash_completion.install "target/completion/tw.bash"
        zsh_completion.install "target/completion/_tw"
        fish_completion.install "target/completion/tw.fish"
    end
  
    test do
      system "#{bin}/tw", "--version"
    end
  end
