class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "32e34d94b3c4f0a1e7d9b03f9b17fb34bcd97e10e3c3115f2405eb79986d4952" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a813ae6a2a510061123bae8e704fedd5988f6bf09a3e6006b8f963807398447c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2534e4bd0cc2d13f6da3f5780afb89838ac8734bea91a0746d887700e4e6089c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1363+825da3476.tar.xz"
  version "0.12.0-dev.1363+825da3476"
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
