class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260820-005437"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "68c267ae5a4fdf7e16043393f5bfba3bfcf822f61bc105bada11b4c1da662152"
    sha256 cellar: :any_skip_relocation, sequoia:      "d3a28df5b0157740e6684394dfd8a9159dd25d28105ac7b3304d921d2b0a6a81"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a713c21eb3a22d5f40e28d1653ec5596e8815ad4a6b91d5b197afb9d117b037d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a097b4455d1ae8cedf5489dece3837561d616bd5210272e5f8025b74141970c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b26315d833480ccf5d6f5cacfbe88aa38a78fbbb014ee1768602c4e7b466f2ba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5e4c8acea6b9eea329480b500ad3ce28aff546e89cd37276b6306142cf7ee7d2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1818+7051f8e73.tar.xz"
  version "0.17.0-dev.1818+7051f8e73"
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
