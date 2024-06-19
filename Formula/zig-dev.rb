class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "69074f8d920bb78f62c7789fb4c2789c51c71ddb7a20d726f8cefd4bbf212166" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "604ef647244a04403233c76800d3422b20853059b84982955d79ea35c2f94c71" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9809815e5c5632555c319e04bb125ed0baffef7cba60b5ca70d47ec61612ab38" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.65+5f2bdafa3.tar.xz"
  version "0.14.0-dev.65+5f2bdafa3"
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
