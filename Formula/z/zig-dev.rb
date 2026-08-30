class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260830-132820"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8915c955a6fa7f9c351f0f4d93954bdcf66c15caa0943d63e3bea1c49c4e5538"
    sha256 cellar: :any_skip_relocation, sequoia:      "b139114e9b58956fdd6a05017a68862759f008caaaac23d5f392428f284a2651"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "718632863f768f57feadfbdac450f5b438ebbfd99eb1c2d05d1085c3916e36ef"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ab9f0d015abb75c0c9c039f7191711a7a2fc72c984458f553926725794791dd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e08d4485c96d2d31a8ce3ae80a58badec202920b675149ad6b0c3b974ec7c005" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "38620c06ca57b175f7dab8f65c8001f9a67b0ff1987c344d4e64ccb72b57174f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1936+5a625d5f3.tar.xz"
  version "0.17.0-dev.1936+5a625d5f3"
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
