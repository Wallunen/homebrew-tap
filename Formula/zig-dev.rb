class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e0a8ffe6932ea195eb84dd730d526774441a4ab11a4c77e2923cdeebc564048f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5faae3b7f64822014ef025d53d94d7be162204b5d61b597c3c24778f3cbd3261" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "54f9f23f76a678570f401e1e04d573dd75232e98736211d9c07b846355b452cf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.174+b8e6c4268.tar.xz"
  version "0.12.0-dev.174+b8e6c4268"
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
