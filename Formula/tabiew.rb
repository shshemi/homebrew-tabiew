class Tabiew < Formula
    desc "Tabiew is a lightweight TUI application to view and query tabular data files, such as CSV, TSV, and parquet."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.8.0.tar.gz"
    version "0.8.0"
    license "MIT"
    sha256 "d8f5a7ab8373d8cb1ca88a8d921f0ce0f44ff34bf5fdbf6afd170594ba28df9a"
  
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
