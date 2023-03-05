class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1d18e591d0699e0192e6814d4334c57e1b7820dd2cb283a9180714341d5efa41" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43b00fb34c6c8d652ca8ec8efcfa3c5aa955b94ee5cd9d368bd015e0565dcb59" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e887d901befd8be38e6a79ff6e5ecf8b8f17bae0c38606e2027e4e55da633424" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1856+653814f76.tar.xz"
  version "0.11.0-dev.1856+653814f76"
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
