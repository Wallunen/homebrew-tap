class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f280f3b92fd3fbd419be67071dcd53dd2f96283a749c4a92912125f2dc8ed2df" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2f246648ca417361a8e0c6f09bd9c17409d7ad4008bdf44a02ccd635a9b5dddc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "03e68d7c1aa6d588ae4b25f15ef53ba8396e5b2ec2eb8532984f13281040ef2e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3633+f7a76bdfe.tar.xz"
  version "0.12.0-dev.3633+f7a76bdfe"
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
