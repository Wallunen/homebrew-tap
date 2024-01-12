class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d7ac7de849b843d3c95aea3285169af5b0726b927be655be46a1b1582697eac6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6a49d8ba1f889871d6b233670aa5402042a66ab0bbeb8557e25d53cb83ea8758" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d550f7e2ed3564ff18e5a4389e7a9ab9f763b7b5ce7b3e6b2a9048993ebc3a59" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2150+63de8a598.tar.xz"
  version "0.12.0-dev.2150+63de8a598"
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
