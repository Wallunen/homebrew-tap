class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260903-023632"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "dd1255286a25c60cf4f206efd5d862687b60fdf38958742c523c328852b767af"
    sha256 cellar: :any_skip_relocation, sequoia:      "bcf2adc925bd57f4ecbb681979e32bfa7ea05c6c606d961612d04be80d09c7ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ad3be0b23d363df5528e7ba251608346632dd61ae3d90919ffec9c445dcb1c60"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "15e408a3703072a4de869e0df57c6656edba5c387cbdcf5d7d29f19101c91f32" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1c2a401aa16c0bc15a03530249571ec7c02e8d60bf3d2c05bb59229a480bdda1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "420c00d84026f8bc9f46f7c603de809429abd274119d3ea8f4f984fb2a7c6c10" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1978+c961124d9.tar.xz"
  version "0.17.0-dev.1978+c961124d9"
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
