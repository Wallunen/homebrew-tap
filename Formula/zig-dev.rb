class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7cb01640984bf4e3fb1cfa1b07b72927e3e268b91d640fa9858a4b44d5d0991f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9b5f78b7f368966749c3af2dd9ff2996a8c50c84ef25cf7e5fddbd36248bc280" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ab7397c681c38104b91a3950d984fadff9d40484b0f54521fb750062c2ef1ffd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3987+2896266a0.tar.xz"
  version "0.11.0-dev.3987+2896266a0"
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
