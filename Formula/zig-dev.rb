class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ea580dc6d3c40468923d69051f85425213aca2045f08b808bba847138280f025" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "59cbb0c96ce5b8ca0ca3e20bf778fba9f68b4dd7fadfdc6da22735b65bb569f9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d8aa1c445fa438ebb5fbfdd737ca1fb46c46f24285003aa85f67a95d70ba6454" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.343+2008d0f7c.tar.xz"
  version "0.13.0-dev.343+2008d0f7c"
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
