class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "256b09afa6a4e0cd5c4f8497ef3625ba9b01de2b75f57b728337bc1de4681c9c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cd9f563150b1adb7306912b5acff9b00e39ef283075a42b95186f39bda656862" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "98ce531beaac0e683713ec1843023b8aa81a318686472ff13f2c075f0362bf0a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.363+c3faae6bf.tar.xz"
  version "0.14.0-dev.363+c3faae6bf"
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
