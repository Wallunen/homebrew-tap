class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260726-095353"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "97fe7913c8c25b55aa73f6d3c4ee933dfe3999394fb198f2188db90c3bb6304a"
    sha256 cellar: :any_skip_relocation, sequoia:      "fbc59b2447d3e862b3a56cfd358a8279934acf8178d77d862fe4c7efb3fa676a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "838bbd0f2c7f967df58b49b20d9860668dc8f0cdd891cf3fb66d5463eb01e8cb"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ddca6d2863e5831190bf3011eabfdb5ef19ccd419fc4910f0dcdf1bf91f33839" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "354482aaf24b6a7f69d8b8183999c23b184c6d80b93cf7f62995919f2ee6e642" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "60d83e4295b7057a382ec8dbc416b0dc59918818c0b5010b0491cec65ccd994f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1471+ff10b90bc.tar.xz"
  version "0.17.0-dev.1471+ff10b90bc"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
