class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9dd6038c768ba658fc7869f0c5d57d9264e2c63b5acb2f558d46832b2351a8d5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0edb42bc375672f7acc2353943a8e3cf4fd54ba718ec8283e680860eb28c3a8b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f9a1d57f2dd56ac8f8deb9327a25627e66a296f434a39b9f0f820f81a66bf457" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.706+62a0fbdae.tar.xz"
  version "0.12.0-dev.706+62a0fbdae"
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
