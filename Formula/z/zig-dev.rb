class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9bfa50b761305aeac0432c3ab5e6706410462b0c2cc30c7526c160b51d06414a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b9d49bb6d9317de445b910444ac98e82194fc0fbb4c1bd6d90a108971fdcfde3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "51d94d2aab652a9cce8c83ccd8997d0b96654fde947f2b02801347430aed3cdf" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.655+d30d37e35.tar.xz"
  version "0.14.0-dev.655+d30d37e35"
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
