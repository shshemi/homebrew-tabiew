class Tabiew < Formula
    desc "Tabiew is a lightweight, terminal-based application to view and query delimiter separated value formatted documents, such as CSV and TSV files."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.5.0.tar.gz"
    version "0.5.0"
    license "MIT"
    sha256 "ecf97c79594bf633f575c2ee9a656063e474ddb221ba6704e57252d4ff2f046f"
  
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
