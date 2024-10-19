class Tabiew < Formula
    desc "Tabiew is a lightweight TUI application to view and query tabular data files, such as CSV, TSV, and parquet."
    homepage "https://github.com/shshemi/tabiew"
    url "https://github.com/shshemi/tabiew/archive/refs/tags/v0.7.0.tar.gz"
    version "0.7.0"
    license "MIT"
    sha256 "cd425757c0785fd15a95602bcf15f2c77a178a209e672444299123904cdc6617"
  
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
