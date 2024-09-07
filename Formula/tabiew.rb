class Tabiew < Formula
    desc "Tabiew is a lightweight TUI application to view and query tabular data files, such as CSV, TSV, and parquet."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.6.3.tar.gz"
    version "0.6.3"
    license "MIT"
    sha256 "ec8907e5858a4610b26c38f663760810700c88430b5327b067e0ce8922ae7ffb"
  
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
