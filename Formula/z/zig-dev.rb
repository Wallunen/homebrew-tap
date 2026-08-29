class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260829-002007"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "54bddec16293a56ee098d90bb399a67b7a4165c5c885baeea9cde5e40105ae24"
    sha256 cellar: :any_skip_relocation, sequoia:      "e44d0101ca38f9b808fedb06d5f4396814d5ac1cff0d73cda9bff824117cdeee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "64198d544f4e119f9f715f059732385b0a171deb4f15ab17749126f6a6682b9c"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "75656e1afeddfd4b5b817950ddc420c0047e453341a46fc1a540c1cf34ceae2d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2c502002b37709406d454f55e4165946316d9a4c669cd025e74c30f3b426da19" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "70f35d11bbe1729e3f294ed62a3aa2cfd24041be8e07df2b58e325232baf204f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1902+896bd9e15.tar.xz"
  version "0.17.0-dev.1902+896bd9e15"
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
