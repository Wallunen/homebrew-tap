class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "61c4edb2afdaa84c255a3ad6f20df44552e3cd398ec1519b6645cf8987a5e1e4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f0dda5329d6de95d6ecadd0466b2fd74fd768eac86f89493426133141724169" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19bfc03e2965916f91769d61c783d9478f48da738c6c331f24793b1539ceb832" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1936+adc6dec26.tar.xz"
  version "0.11.0-dev.1936+adc6dec26"
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
