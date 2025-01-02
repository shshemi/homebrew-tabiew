class Tabiew < Formula
    desc "Tabiew is a lightweight TUI application to view and query tabular data files, such as CSV, TSV, and parquet."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.8.1.tar.gz"
    version "0.8.1"
    license "MIT"
    sha256 "912c45cf26d83b96a0003c0134c2971c82cbdf2dda630fa8fa11e41c4ce28150"
  
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
