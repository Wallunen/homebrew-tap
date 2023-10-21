class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "327beeb4d40f4661e21db534fd2f40343c439d6c4544d9ac45d706f3b913378a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "79f029658a5fe4df5bae5dad49ea055fefe97d49ac2c62bc13c861f9ef70eb2e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "44359c2a4759b1c0b16d7e185f31eeb803b33a9b7b53751b586485b81871b4ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1139+4d106076c.tar.xz"
  version "0.12.0-dev.1139+4d106076c"
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
