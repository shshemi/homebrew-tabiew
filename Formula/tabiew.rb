class Tabiew < Formula
    desc "Tabiew is a lightweight, terminal-based application to view and query delimiter separated value formatted documents, such as CSV and TSV files."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.6.0.tar.gz"
    version "0.6.0"
    license "MIT"
    sha256 "c6b779d5e9c793f3d66bf0924a5150bc3f13cce24f4f7193a72a72113f0e7d4d"
  
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
