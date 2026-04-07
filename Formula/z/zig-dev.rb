class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260407-165131"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1d996ca59630c4daab63b0eb150bf743b91935909fb9ae5e47d284b045d5eab1"
    sha256 cellar: :any_skip_relocation, sequoia:      "76db929937a765b72bc01d6384b26e249b000ca807bee90d9075295d9695ea45"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6090a9699610474835a0d644283a933ef727c380d3c65eeb61a416b8928b7698"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2cf579826b564ac76fe54975c402b34d75e1583bcd04f14fcad675e780bff917" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b62693498904c03ecc72beaf97eb1f0e5c6a26ee7e7e7c7b82d586ed8a7158be" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4c30afe5ff1f1945db556b23418d8a4526e3a636496884e2979b39fe11bdfc32" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3132+fd2718f82.tar.xz"
  version "0.16.0-dev.3132+fd2718f82"
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
